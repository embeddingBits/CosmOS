{...}: {
  services = {
    logind = {
      lidSwitch = "suspend-then-hibernate";
      settings.Login = ''
        DefaultTimeoutStopSec = 5s
        HandlePowerKey = ignore # semicolons required??
      '';
    };
  };
}
