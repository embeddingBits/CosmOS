{pkgs, lib,username, ...}: {
  home-manager.users.${username}.home = {
    packages = [ pkgs.eww-wayland ];
  };
  file.".config/eww" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.;};
  };
}
