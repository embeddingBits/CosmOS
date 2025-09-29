{pkgs, lib,username, ...}: {
  programs.waybar = {
  	enable = true;
  	package = pkgs.waybar;
  };
  home-manager.users.${username}.home = {
    file.".config/waybar" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}
