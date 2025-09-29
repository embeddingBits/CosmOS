{home-manager,pkgs, lib, username,...}: {
  home-manager.users.${username}.home = {
    packages = with pkgs; [ lldb clang clang-tools ];
    file.".lldbinit" = {
      source = ./.lldbinit;
    };
  };
}
