{ pkgs, ... }:

let
  gruvboxTheme = import ./gruvbox.nix;
in
{
  programs.qutebrowser = {
    enable = true;

    loadAutoconfig = true;

    aliases = {
      ytdl = ''spawn -v -m zsh -c 'cd ~/video/youtube && youtube-dl \"$@\"' _ {url}'';
    };

    keyBindings = {
      normal = {
        J = "tab-prev";
        K = "tab-next";
        ",m" = "spawn umpv {url}";
        ",M" = "hint links spawn umpv {hint-url}";
        ";M" = "hint --rapid links spawn umpv {hint-url}";
      };
    };

    settings = {
      auto_save.session = true;
      new_instance_open_target = "window";
      tabs.background = true;
      downloads.position = "bottom";
      # spellcheck.languages = ["en-US" "ru-RU"];
      fonts.web.family.fantasy = "FantsqueSansMono Nerd Font";

      # HiDPI
      qt.highdpi = true;

      # Minimize fingerprinting
      content = {
        headers = {
          user_agent =
            "Mozilla/5.0 (X11; Linux x86_64 10.0; rv:68.0) Gecko/20100101 Firefox/68.0";
          accept_language = "en-US,en;q=0.5";
        };
        canvas_reading = false;
        pdfjs = true;
    };


    } // gruvboxTheme;

    extraConfig = ''
      c.content.headers.custom = {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}
    '';

  };
}
