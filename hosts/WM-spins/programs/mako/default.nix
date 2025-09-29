{pkgs, lib, username, ...}: {
  home-manager.users.${username}.services.mako.enable = false;
  home-manager.users.${username}.home = {
    packages = [ pkgs.libnotify pkgs.mako ];
    file.".config/mako" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}
