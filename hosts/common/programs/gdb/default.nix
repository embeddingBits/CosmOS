{pkgs, inputs,...}: {
  inputs.home-manager.users.stig.home = {
    packages = with pkgs; [ gdb gcc clang-tools ];
    file.".gdbinit" = {
      source = ./.gdbinit;
    };
  };
}
