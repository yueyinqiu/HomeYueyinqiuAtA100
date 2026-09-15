{ name, pkgs, nix-airgap, ... }:

pkgs.writeShellApplication {
  name = name;
  text = ''
    ???? home-manager build
    "${nix-airgap.airgap}/bin/nix-airgap" ?????? a100 ???
    ssh a100 ???? switch ???
  '';
}
