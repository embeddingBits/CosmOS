{lib, username, home-manager,...}: {
  programs.fish = {
    enable = true;
  };
  # This symlink to .config/fish is required because NixOS and HM don't offer a way to set the configuration directory.
  home-manager.users.${username}.home.file.".config/fish" = {
    recursive = true;
    source = lib.fileset.toSource { root = ./.; fileset = ./.; };
  };
}
