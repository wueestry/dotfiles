{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: let
  nixGLIntel = inputs.nixGL.packages.${pkgs.system}.nixGLIntel;
  nixGLNvidia = inputs.nixGL.packages.${pkgs.system}.nixGLNvidia;
in {
  # imports = [
  #   (builtins.fetchurl {
  #     url = "https://raw.githubusercontent.com/Smona/home-manager/nixgl-compat/modules/misc/nixgl.nix";
  #     sha256 = "e9f7da06111c7e669dbeef47f1878ed245392d4e7250237eaf791b734899be3c";
  #   })
  # ];

  # nixGL.prefix = "${nixGLIntel}/bin/nixGLIntel";
  nixGL.prefix = "${nixGLNvidia}/bin/nixGLNvidia";

  home = {
    username = "ryan";
    homeDirectory = "/home/ryan";
    stateVersion = "23.11";
    packages = with pkgs; [
      neovim
      (config.lib.nixGL.wrap waybar)
    ];
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      # allowUnfreePredicate = _: true;
    };
  };

  programs.home-manager.enable = true;

  xdg.configFile."environment.d/envvars.conf".text = ''
    PATH="$HOME/.nix-profile/bin:$PATH"
  '';

  wayland.windowManager.hyprland = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.hyprland;
  };
}