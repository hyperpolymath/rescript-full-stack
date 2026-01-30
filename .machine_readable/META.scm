; SPDX-License-Identifier: PMPL-1.0-or-later
; SPDX-FileCopyrightText: 2025 Hyperpolymath
;
; META.scm - Architecture decisions and development practices
; Media-Type: application/meta+scheme

(meta
  (version "1.0.0")
  (project "rescript-full-stack")

  (architecture-decisions
    (adr-001
      (title "ReScript as primary language")
      (status "accepted")
      (date "2025-01-04")
      (context "Need type-safe full-stack development with JS interop")
      (decision "Use ReScript for all application code, compiling to ES6 modules")
      (consequences
        ("Type safety across frontend and backend")
        ("Excellent JS FFI for ecosystem integration")
        ("Smaller community than TypeScript")
        ("Learning curve for ML-family syntax")))

    (adr-002
      (title "Deno over Node.js")
      (status "accepted")
      (date "2025-01-04")
      (context "Need secure, modern runtime with native TypeScript support")
      (decision "Use Deno as primary runtime, discourage Node.js usage")
      (consequences
        ("Explicit permissions for security")
        ("Web-standard APIs")
        ("Single executable distribution")
        ("Some npm packages may need compatibility layer")))

    (adr-003
      (title "TEA architecture over Redux/MobX")
      (status "accepted")
      (date "2025-01-04")
      (context "Need predictable state management for frontend")
      (decision "Use The Elm Architecture via rescript-tea")
      (consequences
        ("Functional purity")
        ("Predictable state updates")
        ("Easy testing")
        ("Proven pattern from Elm ecosystem")))

    (adr-004
      (title "SharedArrayBuffer for WASM interop")
      (status "accepted")
      (date "2025-01-04")
      (context "Need high-performance data transfer between JS and WASM")
      (decision "Use SharedArrayBuffer for zero-copy transfer")
      (consequences
        ("10-100x faster for large data")
        ("Requires Cross-Origin-Isolation headers")
        ("Required for concurrent WASM")))

    (adr-005
      (title "Rust for WASM compute")
      (status "accepted")
      (date "2025-01-04")
      (context "Need high-performance compute modules")
      (decision "Write compute-intensive code in Rust, compile to WASM")
      (consequences
        ("Near-native performance")
        ("Strong type system")
        ("wasm-bindgen for JS interop")
        ("Two-language maintenance"))))

  (development-practices
    (code-style
      (formatter "rescript format")
      (linter "deno lint")
      (module-format "es6")
      (file-extension ".res"))

    (security
      (permissions-model "explicit")
      (dependency-review "required")
      (supply-chain "deno vendor for production"))

    (testing
      (unit-framework "rescript-test or vitest")
      (integration "deno test")
      (e2e "playwright"))

    (versioning
      (strategy "semantic")
      (breaking-changes "major-version-only")
      (deprecation "one-minor-before-removal"))

    (documentation
      (format "asciidoc")
      (api-docs "generated from .resi files")
      (examples "required for all public APIs"))

    (branching
      (strategy "trunk-based")
      (main-branch "main")
      (feature-branches "short-lived")))

  (design-rationale
    (why-rescript
      "ReScript provides the type safety of ML languages with seamless JS interop. 
       Unlike TypeScript, it has sound types and predictable compilation output.
       The TEA architecture from Elm transfers cleanly to ReScript.")

    (why-deno
      "Deno addresses Node.js security concerns with explicit permissions.
       Native TypeScript execution simplifies the toolchain.
       Web-standard APIs reduce platform-specific code.")

    (why-wasm
      "WASM provides portable, sandboxed compute that runs anywhere.
       SharedArrayBuffer enables zero-copy data sharing.
       Rust provides memory-safe systems programming.")

    (why-not-typescript
      "TypeScript has unsound types and complex toolchain.
       ReScript provides equivalent JS interop with better guarantees.
       ML syntax encourages functional programming patterns.")

    (why-not-nodejs
      "Node.js lacks Denore security model.
       npm has supply chain attack vectors.
       node_modules creates dependency hell.")))
