{lib, username,...}: {
  services.displayManager.autoLogin = {
    enable = true;
    user = username;
  };
  services.xserver = {
    # enable = true;
    displayManager = {
      lightdm.enable = lib.mkForce false;
      gdm = {
        enable = true;
        autoSuspend = false;  # Disable automatic suspend
      };
    };
  };
}
