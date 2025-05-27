{ pkgs, ... }:

{
  users.users.paulk = {
    isNormalUser = true;
    home = "/home/paulk";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
  };
}
