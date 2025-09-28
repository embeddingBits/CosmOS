{ pkgs, lib, config, ... }:

let
  cfg = config.optionz.stig.niri;
in {
  options.optionz.stig.niri.enabled = lib.mkEnableOption "Enable Niri setup for user stig";

  config = lib.mkIf cfg.enable {
    imports = [
      ../hyprland/ecosystem.nix
    ];

    home = {
      packages = [
        pkgs.niri
        pkgs.xwayland-satellite
      ];
      activation.cleanupNiri = lib.mkBefore ''
        rm -rf ~/.config/niri
      '';
      activation.niriSymlinks = lib.mkAfter ''
        mkdir -p ~/.config/niri
        ln -sf ~/.nixos/home/programs/rice/WMs/niri/config.kdl ~/.config/niri/config.kdl
      '';
    };
  };
}
