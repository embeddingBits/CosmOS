{pkgs,inputs,...}: {
  inputs.home-manager.users.stig = {
    home.packages = with pkgs; [ bat eza ripgrep ];
  };
}
