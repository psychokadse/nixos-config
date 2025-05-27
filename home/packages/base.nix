{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    neovim
    firefox
    wezterm
    stow
    zoxide
    fzf
    tmux
    tree
    zip
    unzip
    fd
  ];
}
