{ ... }: {
  imports = [
    ./packages
  ];

  home.username = "yueyinqiu";
  home.homeDirectory = "/media/a100/c5e1bf65-7974-432f-8aed-7a1345241efe/lujiaqi/yueyinqiu";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "26.05";
}
