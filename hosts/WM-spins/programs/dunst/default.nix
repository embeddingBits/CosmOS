{pkgs, lib, username, ...}: {
  home-manager.users.${username}.home = {
    packages = [ pkgs.libnotify pkgs.dunst ];
    file.".config/dunst" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}
