{pkgs,inputs,...}: {
  environment.systemPackages = [ pkgs.ghostty ];
  inputs.home-manager.users.stig.home = {
    # packages = [ pkgs.ghostty ];
    file.".config/ghostty/config".source = ./config;
  };
}
