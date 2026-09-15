{ ... }: {
  programs.home-manager.enable = true;
  services.home-manager.autoExpire.enable = true;
  services.home-manager.autoExpire.frequency = "weekly";
  services.home-manager.autoExpire.timestamp = "-7 days";
}
