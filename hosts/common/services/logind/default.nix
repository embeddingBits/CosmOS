{...}: {
  services = {
    logind = {
      settings.Login = {
        HandleLidSwitch = "suspend-then-hibernate";
        DefaultTimeoutStopSec = "5s";
        HandlePowerKey = "ignore"; # semicolons required??
      };
    };
  };
}
