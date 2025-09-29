{pkgs, inputs, username, ...}: {
  home-manager.users.${username}.home = {
    packages = with pkgs; [ gdb gcc clang-tools ];
    file.".gdbinit" = {
      source = ./.gdbinit;
    };
  };
}
