{pkgs, lib, username, ...}: {
  home-manager.users.${username}.home = {
    packages = [ pkgs.tmux ];
  };
  file.".config/tmux" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.;};
  };
}
