{pkgs, lib, config, ...}:
let
  niriEnabled = config.optionz.stig.niri.enabled or false;
in
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "stratos-fonts" ];
  # this isn't actually necessary because the stratos-sddm flake sets this up automatically.
  # services.displaymanager.sddm = {
    # enable = true;
  # };

  # if Niri is enabled (i.e if pkgs.niri is installed), add the Niri session to SDDM
  # this is because niri does NOT create a desktop session. SDDM therefore cannot display the Niri session. This fixes that.
  # ly reads from the binary and hence does not suffer from this issue.
  services.displayManager.sessionPackages = lib.optionals niriEnabled [ pkgs.niri ]; # i.e if the custom Niri option is true
}
