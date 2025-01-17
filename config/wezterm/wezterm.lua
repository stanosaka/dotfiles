local wezterm = require "wezterm"

-- local hostname = wezterm.hostname()

-- wezterm.log_info("check value", hostname)

return {
    -- default_prog = {"/run/current-system/sw/bin/tmux"},
    font = wezterm.font("FantasqueSansMono Nerd Font", {weight = "Regular", italic = false}),
    font_size = 11.0,
    enable_tab_bar = false,
    color_scheme = "Gruvbox Dark",
    -- color_scheme = "tokyonight_night",
    -- color_schemes = {
    --     tokyonight_storm = require("./tokyonight").storm,
    --     tokyonight_night = require "./tokyonight".night
    -- },
    disable_default_key_bindings = true,
    adjust_window_size_when_changing_font_size = false,
    keys = {
      -- {key="c", mods="SUPER", action=wezterm.action{CopyTo="Clipboard"}},
      -- {key="c", mods="ALT", action=wezterm.action{SendString="\x03"}},
      { key="c", mods="SUPER", action=wezterm.action{CopyTo="Clipboard"} },
      { key="v", mods="SUPER", action=wezterm.action{PasteFrom="Clipboard"} },
      { key="Insert", mods="SHIFT", action=wezterm.action{PasteFrom="Clipboard"} },
      { key="=", mods="CTRL", action="IncreaseFontSize" },
      { key="-", mods="CTRL", action="DecreaseFontSize" },
    }
}
