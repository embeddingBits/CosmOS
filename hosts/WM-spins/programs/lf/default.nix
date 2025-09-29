{pkgs, lib, username,...}: {
  home-manager.users.${username}.home = {
    packages = [ pkgs.lf ];
  };
  file.".config/lf" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.;};
  };
}
