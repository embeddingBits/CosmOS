{pkgs,lib,inputs,...}: {
  inputs.home-manager.users.stig = {
    gtk = {
      enable = true;
    };
  };
}
