{pkgs, lib, username, ...}: {
  home-manager.users.${username}.home = {
    packages = [ pkgs.zellij ];
    file.".config/zellij" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}
