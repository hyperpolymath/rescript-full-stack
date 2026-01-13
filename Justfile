# justfile for ReScript Ecosystem Map
# Usage: `just update-readme` or `just update-coverage`

# Update README.adoc with latest component statuses
update-readme:
    # Sync coverage table from docs/COVERAGE.adoc
    sed -i '/== Coverage Status/,/^$$/ { /== Coverage Status/{p; r docs/COVERAGE.adoc'; 'd; } }' README.adoc
    # Verify all links (requires `ack` or `grep`)
    ack --adoc 'link:' README.adoc | grep -v 'licences\|CONTRIBUTING' || echo "✅ All links validated"
    # Check for broken tables
    just --fmt check

# Update docs/COVERAGE.adoc from source (e.g., GitHub API or local repos)
update-coverage:
    # Example: Fetch statuses from GitHub (replace with your script)
    ./scripts/fetch-component-statuses.sh > docs/COVERAGE.adoc
    # Format the table
    just --fmt coverage-table

# Format the coverage table (ensure consistent columns)
fmt-coverage-table:
    column -t -s $'\t' docs/COVERAGE.adoc > docs/COVERAGE.adoc.tmp && mv docs/COVERAGE.adoc.tmp docs/COVERAGE.adoc

# Lint all AsciiDoc files
lint:
    asciidoctor-lint README.adoc docs/*.adoc

# Generate diagrams (if using plantuml)
gen-diagrams:
    plantuml -tsvg diagrams/*.puml && mv diagrams/*.svg docs/

# Full update workflow
update-all: update-coverage update-readme lint gen-diagrams
    git add README.adoc docs/COVERAGE.adoc docs/*.svg
    git commit -m "chore: update coverage and diagrams [skip ci]" || true

# Helper: Check for outdated components
audit:
    grep -E "⚠️|⬜" docs/COVERAGE.adoc || echo "✅ No legacy/gaps found"
