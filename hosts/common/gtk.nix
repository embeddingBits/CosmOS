{username, home-manager, ...}: {
  home-manager.users.${username} = {
    gtk = {
      enable = true;
    };
  };
}
