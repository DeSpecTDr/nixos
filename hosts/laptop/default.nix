{ config, pkgs, lib, ... }: {
  imports = [
    ./hardware.nix
    ../../modules/greetd.nix
  ];

  networking.hostName = "nixos";

  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
  ];

  # TODO: move this to sway (somehow)
  # TODO: check if it works without it
  security.pam.services."swaylock".text = "auth include login";
}
