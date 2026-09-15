{ pkgs, nix-airgap, ... }:

pkgs.mkShell {
  packages =
    map
      (
        name:
        import ./packages/${name} {
          pkgs = pkgs;
          name = name;
          nix-airgap = nix-airgap;
        }
      )
      (
        builtins.attrNames (
          pkgs.lib.filterAttrs (
            name: type: type == "directory" && builtins.pathExists ./packages/${name}/default.nix
          ) (builtins.readDir ./packages)
        )
      );
}
