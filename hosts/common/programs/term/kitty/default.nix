{pkgs, lib,inputs,username, home-manager,...}: {
  environment.systemPackages = [ pkgs.kitty ];
  home-manager.users.${username}.home = {
    # packages = [ pkgs.kitty ];
    file.".config/kitty" = {
      recursive = true;
      source = lib.fileset.toSource { root = ./.; fileset = ./.; };
    };
  };
}
