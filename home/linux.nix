{ pkgs, system, username, config, ...}: {
  imports = [
    ./core.nix
    ./programs
  ];
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
  };
}
