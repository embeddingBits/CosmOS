{pkgs, lib,username, ...}: {
  home-manager.users.${username}.home = {
    packages = [ pkgs.btop ];
    file.".config/btop" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.;};
    };
  };
}
