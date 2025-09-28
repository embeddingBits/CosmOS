{...}: {
  imports = [
    ./displaymanager
    ./desktopmanager
    ./power-profiles-daemon
  ];
  networking.hostName = "Krypton";
}
