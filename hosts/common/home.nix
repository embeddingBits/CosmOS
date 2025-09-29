{pkgs,inputs, home-manager, username, ...}: {
  home-manager.users.${username} = {
    home.packages = with pkgs; [ bat eza ripgrep ];
  };
}
