{username,...}: {
  programs.zsh.enable = true;
  home-manager.users.${username}.home.file = {
    ".config/zsh/zshrc".source = ./zshrc;
    ".config/zsh/omz-git.zsh".source = ./omz-git.zsh;
  };
}
