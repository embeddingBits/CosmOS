{pkgs,username,...}: {
  imports = [ 
    ./hyprland 
  ];
  home-manager.users.${username}.home.packages = with pkgs; [ networkmanagerapplet blueman eww grim slurp swappy playerctl swayosd ];
}
