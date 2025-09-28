{pkgs, lib,inputs, ...}: {
  environment.systemPackages = [ pkgs.kitty ];
  inputs.home-manager.users.stig.home = {
    # packages = [ pkgs.kitty ];
    file.".config/kitty" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}
