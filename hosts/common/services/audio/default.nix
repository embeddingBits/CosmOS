{...}: {
  hardware = {
    bluetooth.enable = false;
  };
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      pulse.enable = true;
      # use the example session manager (no others are packaged yet so this is enabled by default.
      # no need to redefine it in your config for now)
      # media-session.enable = true;
      wireplumber.enable = false;
      alsa = {
        enable = false;
        support32Bit = false;
      };
    };
  };
}
