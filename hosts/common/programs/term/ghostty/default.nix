{pkgs,username,home-manager,inputs, ...}: {
  environment.systemPackages = [ pkgs.ghostty ];
  home-manager.users.${username}.home = {
    # packages = [ pkgs.ghostty ];
    file.".config/ghostty/config".source = ./config;
  };
}
