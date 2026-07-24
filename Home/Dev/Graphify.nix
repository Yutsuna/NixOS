{
  pkgs,
  graphify,
  ...
}:

let
  python3Packages = pkgs.python3Packages.override {
    overrides = self: super: {
      pybloomfilter3 = super.pybloomfilter3.overridePythonAttrs (old: {
        dontCheckPythonMetadata = true;
      });
    };
  };
in
with python3Packages;
let
  graphify-pkg = buildPythonApplication {
    pname = "graphify";
    version = "latest";

    pyproject = true;

    src = graphify;

    build-system = [
      setuptools
    ];

    dontCheckRuntimeDeps = true;

    propagatedBuildInputs = [
      networkx
      datasketch
      rapidfuzz
      tree-sitter
    ]
    ++ (builtins.map (g: g.overridePythonAttrs (old: { dontCheckPythonMetadata = true; })) (with tree-sitter-grammars; [
      tree-sitter-python
      tree-sitter-javascript
      tree-sitter-typescript
      tree-sitter-go
      tree-sitter-rust
      tree-sitter-java
      tree-sitter-c
      tree-sitter-cpp
      tree-sitter-ruby
      tree-sitter-c-sharp
      tree-sitter-kotlin
      tree-sitter-scala
      tree-sitter-php
      tree-sitter-swift
      tree-sitter-lua
      tree-sitter-zig
      tree-sitter-elixir
      tree-sitter-objc
      tree-sitter-julia
      tree-sitter-verilog
      tree-sitter-fortran
      tree-sitter-bash
      tree-sitter-json
      tree-sitter-crystal
    ]));

    doCheck = false;
  };
in
{
  home.packages = [
    graphify-pkg
  ];
}
