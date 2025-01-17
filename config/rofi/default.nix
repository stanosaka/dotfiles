{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.wezterm}/bin/wezterm";
    theme = "gruvbox-dark";
    font = "FantasqueSansMono Nerd Font Regular 28";
    extraConfig = {
      modi = "window,drun,run,ssh";
    };
  };
}
