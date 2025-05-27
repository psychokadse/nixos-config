{ home-manager, disko, ... }: {
  imports = [
    (import ./templates/encrypted-with-swap.nix {
      inherit disko;
      mainDevice = "/dev/sda";
      swapSize = "8G";
    })
    home-manager.nixosModules.home-manager
  ];

  system.stateVersion = "25.05";
}
