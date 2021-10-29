{ pkgs }:

with pkgs;

writeShellScriptBin "remaps" ''
  ${pkgs.xorg.xinput}/bin/xinput set-prop 'Kensington Expert Mouse' 'libinput Scroll Method Enabled' 0, 0, 1
  ${pkgs.xorg.xinput}/bin/xinput set-prop 'Kensington Expert Mouse' 'libinput Button Scrolling Button' 8
''
