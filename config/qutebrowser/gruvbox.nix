# Originally based on:
#
#   gruvbox dark hard qutebrowser theme by Florian Bruhin <me@the-compiler.org> (https://github.com/The-Compiler/dotfiles/tree/master/qutebrowser)
#   base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
#   Base16 qutebrowser template by theova and Daniel Mulford
#   Gruvbox dark, hard scheme by Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)

let
  bg0_hard = "#1d2021";
  bg0_soft = "#32302f";
  bg0_normal = "#282828";

  bg0 = "#282828"; # bg0_normal
  bg1 = "#3c3836";
  bg2 = "#504945";
  bg3 = "#665c54";
  bg4 = "#7c6f64";

  fg0 = "#fbf1c7";
  fg1 = "#ebdbb2";
  fg2 = "#d5c4a1";
  fg3 = "#bdae93";
  fg4 = "#a89984";

  bright_red = "#fb4934";
  bright_green = "#b8bb26";
  bright_yellow = "#fabd2f";
  bright_blue = "#83a598";
  bright_purple = "#d3869b";
  bright_aqua = "#8ec07c";
  bright_gray = "#928374";
  bright_orange = "#fe8019";

  dark_red = "#cc241d";
  dark_green = "#98971a";
  dark_yellow = "#d79921";
  dark_blue = "#458588";
  dark_purple = "#b16286";
  dark_aqua = "#689d6a";
  dark_gray = "#a89984";
  dark_orange = "#d65d0e";
in
  rec {
    colors = {

      completion.fg = [fg1 bright_aqua bright_yellow];
      completion.odd.bg = bg0;
      completion.even.bg = colors.completion.odd.bg;
      completion.category.fg = bright_blue;
      completion.category.bg = bg1;
      completion.category.border.top = colors.completion.category.bg;
      completion.category.border.bottom = colors.completion.category.bg;
      completion.item.selected.fg = fg0;
      completion.item.selected.bg = bg4;
      completion.item.selected.border.top = bg2;
      completion.item.selected.border.bottom = colors.completion.item.selected.border.top;
      completion.item.selected.match.fg = bright_orange;
      completion.match.fg = colors.completion.item.selected.match.fg;
      completion.scrollbar.fg = colors.completion.item.selected.fg;
      completion.scrollbar.bg = colors.completion.category.bg;

      contextmenu.disabled.bg = bg3;
      contextmenu.disabled.fg = fg3;
      contextmenu.menu.bg = bg0;
      contextmenu.menu.fg =  fg2;
      contextmenu.selected.bg = bg2;
      contextmenu.selected.fg = colors.contextmenu.menu.fg;

      downloads.bar.bg = bg0;
      downloads.start.fg = bg0;
      downloads.start.bg = bright_blue;
      downloads.stop.fg = colors.downloads.start.fg;
      downloads.stop.bg = bright_aqua;
      downloads.error.fg = bright_red;

      hints.fg = bg0;
      hints.match.fg = bg4;

      keyhint.fg = fg4;
      keyhint.suffix.fg = fg0;
      keyhint.bg = bg0;

      messages.error.fg = bg0;
      messages.error.bg = bright_red;
      messages.error.border = colors.messages.error.bg;
      messages.warning.fg = bg0;
      messages.warning.bg = bright_purple;
      messages.warning.border = colors.messages.warning.bg;
      messages.info.fg = fg2;
      messages.info.bg = bg0;
      messages.info.border = colors.messages.info.bg;

      prompts.fg = fg2;
      prompts.border = "1px solid ${bg1}";
      prompts.bg = bg3;
      prompts.selected.bg = bg2;

      statusbar.normal.fg = fg2;
      statusbar.normal.bg = bg0;
      statusbar.insert.fg = bg0;
      statusbar.insert.bg = dark_aqua;
      statusbar.passthrough.fg = bg0;
      statusbar.passthrough.bg = dark_blue;
      statusbar.private.fg = bright_purple;
      statusbar.private.bg = bg0;
      statusbar.command.fg = fg3;
      statusbar.command.bg = bg1;
      statusbar.command.private.fg = colors.statusbar.private.fg;
      statusbar.command.private.bg = colors.statusbar.command.bg;
      statusbar.caret.fg = bg0;
      statusbar.caret.bg = dark_purple;
      statusbar.caret.selection.fg = colors.statusbar.caret.fg;
      statusbar.caret.selection.bg = bright_purple;
      statusbar.progress.bg = bright_blue;
      statusbar.url.fg = fg4;
      statusbar.url.error.fg = dark_red;
      statusbar.url.hover.fg = bright_orange;
      statusbar.url.success.http.fg = bright_red;
      statusbar.url.success.https.fg = fg0;
      statusbar.url.warn.fg = bright_purple;

      tabs.bar.bg = bg0;
      tabs.indicator.start = bright_blue;
      tabs.indicator.stop = bright_aqua;
      tabs.indicator.error = bright_red;
      tabs.odd.fg = fg2;
      tabs.odd.bg = bg2;
      tabs.even.fg = colors.tabs.odd.fg;
      tabs.even.bg = bg3;
      tabs.selected.odd.fg = fg2;
      tabs.selected.odd.bg = bg0;
      tabs.selected.even.fg = colors.tabs.selected.odd.fg;
      tabs.selected.even.bg = bg0;
      tabs.pinned.even.bg = bright_green;
      tabs.pinned.even.fg = bg2;
      tabs.pinned.odd.bg = bright_green;
      tabs.pinned.odd.fg = colors.tabs.pinned.even.fg;
      tabs.pinned.selected.even.bg = bg0;
      tabs.pinned.selected.even.fg = colors.tabs.selected.odd.fg;
      tabs.pinned.selected.odd.bg = colors.tabs.pinned.selected.even.bg;
      tabs.pinned.selected.odd.fg = colors.tabs.selected.odd.fg;

      webpage.bg = bg4;
    };
  }
