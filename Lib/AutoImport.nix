{
  lib,
  ...
}:
let
  hasSuffix = lib.strings.hasSuffix;
  isNotElem = list: elem: !(builtins.elem elem list);

  scanAndMapFilter =
    predicate: mapper: path:
    lib.trivial.pipe path [
      builtins.readDir
      (lib.filterAttrs (predicate path))
      (lib.mapAttrs' (mapper path))
    ];
in
{
  scanPaths =
    path:
    builtins.attrValues (
      scanAndMapFilter
        (
          p: name: type:
          type == "directory" && builtins.pathExists (p + "/${name}/default.nix")
        )
        (p: name: _: {
          name = name;
          value = p + "/${name}";
        })
        path
    );

  scanFiles =
    ext: exclude: mapper: path:
    scanAndMapFilter (
      _: name: type:
      type == "regular" && hasSuffix ext name && isNotElem exclude name
    ) (_: mapper) path;
}
