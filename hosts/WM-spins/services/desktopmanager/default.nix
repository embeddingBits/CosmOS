{pkgs, config, lib,...}: {
  let
    /* https://www.youtube.com/watch?v=dQw4w9WgXcQ */
    hyprlandEnabled = config.options.hyprland.enabled or false;
    niriEnabled = config.options.hyprland.enabled or false;
  in
    {
      environment.systemPackages = with pkgs; [
        eww
        grim slurp swappy
        playerctl
        swayosd
      ];
      imports = lib.optional (hyprlandEnabled || niriEnabled)
        ../../programs;
    }
}
