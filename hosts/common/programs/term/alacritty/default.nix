{pkgs, lib, username, ...}: {
  home-manager.users.${username}.home = {
    packages = [ pkgs.alacritty ];
    file.".config/alacritty" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}
