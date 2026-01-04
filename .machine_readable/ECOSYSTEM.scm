; SPDX-License-Identifier: AGPL-3.0-or-later
; SPDX-FileCopyrightText: 2025 Hyperpolymath
;
; ECOSYSTEM.scm - Position in ecosystem and related projects
; Media-Type: application/vnd.ecosystem+scm

(ecosystem
  (version "1.0.0")
  (name "rescript-full-stack")
  (type "ecosystem-map")
  (purpose "Complete map of ReScript ecosystem across all stack layers")

  (position-in-ecosystem
    (role "organizing-framework")
    (scope "full-stack-development")
    (relationship-to-rescript "ecosystem-documentation-and-integration")
    (target-audience
      ("ReScript developers building full-stack apps")
      ("Teams evaluating ReScript for production")
      ("Contributors to ReScript ecosystem")))

  (related-projects
    ;; Hyperpolymath owned components
    (rescript-tea
      (relationship "sibling-component")
      (purpose "TEA architecture for frontend")
      (status "active")
      (url "https://github.com/hyperpolymath/rescript-tea"))

    (cadre-tea-router
      (relationship "sibling-component")
      (purpose "TEA-integrated routing")
      (status "active")
      (url "https://github.com/hyperpolymath/cadre-tea-router"))

    (rescript-wasm-runtime
      (relationship "sibling-component")
      (purpose "Server runtime with WASM support")
      (status "active")
      (url "https://github.com/hyperpolymath/rescript-wasm-runtime"))

    (rescribe-ssg
      (relationship "sibling-component")
      (purpose "Static site generator in ReScript")
      (status "active")
      (url "https://github.com/hyperpolymath/rescribe-ssg"))

    (rescript-postgres
      (relationship "sibling-component")
      (purpose "PostgreSQL client")
      (status "in-development")
      (url "https://github.com/hyperpolymath/rescript-postgres"))

    ;; Community components
    (rescript-core
      (relationship "dependency")
      (purpose "Standard library")
      (status "stable")
      (url "https://github.com/rescript-lang/rescript-core"))

    (rescript-react
      (relationship "integration")
      (purpose "React bindings")
      (status "stable")
      (url "https://github.com/rescript-lang/rescript-react"))

    (rescript-schema
      (relationship "recommended-component")
      (purpose "Runtime validation")
      (status "stable")
      (url "https://github.com/DZakh/rescript-schema"))

    (rescript-relay
      (relationship "integration")
      (purpose "GraphQL client")
      (status "stable")
      (url "https://github.com/zth/rescript-relay"))

    ;; MCP tooling
    (poly-mcps
      (relationship "complementary")
      (purpose "MCP servers for LLM integration")
      (status "active")
      (url "https://github.com/hyperpolymath/poly-mcps"))

    ;; Standards
    (rhodium-standard-repositories
      (relationship "governance")
      (purpose "Repository standards")
      (status "active")
      (url "https://github.com/hyperpolymath/rhodium-standard-repositories")))

  (what-this-is
    ("Organizing framework for ReScript full-stack development")
    ("Documentation of ecosystem coverage and gaps")
    ("Integration patterns between components")
    ("Roadmap for ecosystem completion")
    ("MoSCoW prioritization of missing components"))

  (what-this-is-not
    ("Not a monorepo containing all components")
    ("Not a framework with runtime dependencies")
    ("Not a replacement for official ReScript docs")
    ("Not infrastructure bindings - use poly-mcps for that")))
