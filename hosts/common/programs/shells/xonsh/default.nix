{pkgs, lib, username, ...}: {
  home-manager.users.${username}.home = {
    packages = [ pkgs.xonsh ];
    file.".config/xonsh" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}

