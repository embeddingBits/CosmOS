{...}: {
  imports = [
    ./starship
    ./shells
    ./gnupg
    ./term
    ./nix
    ./git
    ./ssh
    ./gdb
    # ./plymouth # causes problems when building the ISO
  ];
}
