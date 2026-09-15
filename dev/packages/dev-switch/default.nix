{ name, pkgs, nix-airgap, ... }:

let
  installable = ".#homeConfigurations.\"yueyinqiu@a100\".activationPackage";
  remoteHost = "a100";
  remoteOutLink = "/media/a100/c5e1bf65-7974-432f-8aed-7a1345241efe/lujiaqi/yueyinqiu/.cache/dev-switch/result";
in
pkgs.writeShellApplication {
  inherit name;
  text = ''
    "${nix-airgap.airgap}/bin/nix-airgap" \
      "${installable}" \
      "${remoteHost}" \
      --remote-out-link "${remoteOutLink}"

    ssh "${remoteHost}" -- "${remoteOutLink}/activate"
  '';
}
