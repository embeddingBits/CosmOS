{ pkgs,config,home-manager,lib, username, ... }:

let
  cfg = config.options.hyprland;
in
{
  options.hyprland.enabled = lib.mkEnableOption "Enable Hyprland";
  config = lib.mkIf cfg.enable {
    imports = [ ./ecosystem.nix ];
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    programs.hyprlock.enable = true;
    services.hypridle.enable = true;
    home-manager.users.${username}.home = {
      packages = with pkgs; [ hyprpaper hyprcursor ];
      activation.preHyprland = lib.mkBefore ''
        rm -rf ~/.config/hypr/hyprland.conf
        rm -rf ~/.config/hypr/hypridle.conf
        rm -rf ~/.config/hypr/hyprlock.conf
        rm -rf ~/.config/hypr/hyprpaper.conf
        rm -rf ~/.config/hypr/pyprland.toml
      '';
      activation.postHyprland = lib.mkAfter ''
        mkdir -p ~/.config/hypr
        ln -sf ~/.nixos/hosts/WM-spins/programs/WMs/hyprland/hyprland.conf ~/.config/hypr/hyprland.conf
        ln -sf ~/.nixos/hosts/WM-spins/programs/WMs/hyprland/hypridle.conf ~/.config/hypr/hypridle.conf
        ln -sf ~/.nixos/hosts/WM-spins/programs/WMs/hyprland/hyprlock.conf ~/.config/hypr/hyprlock.conf
        ln -sf ~/.nixos/hosts/WM-spins/programs/WMs/hyprland/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
        ln -sf ~/.nixos/hosts/WM-spins/programs/WMs/hyprland/pyprland.toml ~/.config/hypr/pyprland.toml
      '';
    };
  };
}
