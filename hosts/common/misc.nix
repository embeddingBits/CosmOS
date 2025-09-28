{...}: {
  environment.variables = {
    NIX_STRIP_DEBUG="1";
    PATH = "dots/scripts:$PATH";
    MOZ_ENABLE_WAYAND = "true";
    # GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/glib-2.0/schemas"; # not reqd anymore, gsettings is not being used
  };
  # system.activationScripts.changeUinputPermissions = {
  #   text = ''
  #     sudo modprobe uinput
  #     chmod a+rw /dev/uinput
  #   '';
  # };
  hardware.cpu.intel.updateMicrocode = true;
  systemd.sleep.extraConfig = "HibernateDelaySec=3600"; # "HibernateDelaySec=3600\nOtherOptions\nMoreOptions"
  programs.nix-ld.enable = true;
}
