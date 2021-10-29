{ config, lib, pkgs, ... }:

let
  customPlugins = pkgs.callPackage ./custom-plugins.nix {
    inherit (pkgs.vimUtils) buildVimPlugin;
  };

  plugins = pkgs.vimPlugins // customPlugins;

  overriddenPlugins = with pkgs; [];

  myVimPlugins = with plugins; [
  # UI
    gruvbox
    # material-nvim
    # srcery-vim
    # tokyonight-nvim
    lualine-nvim
    vim-buftabline
    vim-devicons            # dev icons shown in the tree explorer
    nvim-web-devicons       # dev icons, lua version
    nvim-colorizer-lua
    neoscroll-nvim
    # nvim-notify             # used with `sniprun`
    # stabilize-nvim          # too immature

    # TODO
    # indent-blankline-nvim
    # nvim-ts-rainbow
    # barbar-nvim
    # sidebar-nvim

  # UTILITY
    aniseed                   # write configs in Fennel!
    vim-sensible              # sensible defaults
    vim-surround              # quickly edit surroundings (brackets, html tags, etc)
    vim-commentary            # comment some code
    vim-repeat                # repeat plugin commands with (.)
    vim-ripgrep               # blazing fast search using ripgrep
    fzf-vim                   # fuzzy finder
    bclose-vim                # Bclose
    tabular                   # align code verically (haskell etc)
    which-key-nvim            # spacemacs-like menu and key bindings
    plenary-nvim              # lua utils
    telescope-nvim
    telescope-fzy-native-nvim # FIXME: what is it?
    telescope-project-nvim    # FIXME: I don't use it
    lightspeed-nvim           # highlights keys to move quickly
    camelcasemotion           # camelCase motions
    # impatient-nvim          # speed up loading lua modules

    # todo
    nvim-tree-lua
    editorconfig-vim
    vim-signature           # FIXME: what is it?
    toggleterm-nvim         # floating termial; used only for lazygit for now

  # DEV
    nvim-lspconfig
    # symbols-outline-nvim    # FIXME: use `aerial.nvim` instead
    trouble-nvim            # diagnostic list
    lsp-colors-nvim         # add missing LSP highlight groups for unsupported color schemes
    nvim-code-action-menu   # TODO: replace with something
    nvim-lsputils           # used for code actions
    luasnip
    nvim-cmp
    cmp-nvim-lsp
    cmp-buffer
    cmp_luasnip
    cmp-path
    formatter-nvim
    nvim-autopairs
    vim-matchup
    nvim-treesitter
    vim-easy-align
    gitsigns-nvim
    numb-nvim               # peek line number
    conjure                 # evaluate some LISP
    vim-parinfer
    # nvim-spectre
    # sniprun                 # evaluate code snippets



    haskell-vim
    purescript-vim
    vim-jsx-pretty
    vim-solidity
    vim-nix                 # nix support (highlighting, etc)
    vim-css-color           # preview css colors
    vimagit
    # emmet-vim
    # vim-gitgutter

    # coc-nvim                # LSP client + autocompletion plugin
    # coc-prettier
    # coc-tsserver
    # coc-json
    # coc-rust-analyzer
    # coc-solargraph          # Ruby Language Server; NOTE: only for course
    vim-better-sml          # SML plugin; NOTE: only for course

  # MISC
    vimwiki                 # TODO: replace by neorg?
    neuron-nvim
    rainbow_parentheses-vim # for nested parentheses

    # TODO
    # neorg

    # ctrlsf-vim              # edit file in place after searching with ripgrep
    # dhall-vim               # Syntax highlighting for Dhall lang
    # fzf-hoogle              # search hoogle with fzf
    # ghcid                   # ghcid for Haskell
    # material-vim            # modern theme with true colors support
    # multiple-cursors        # Multiple cursors selection, etc
    # neomake                 # run programs asynchronously and highlight errors
    # nerdcommenter           # code commenter
    # quickfix-reflector-vim  # make modifications right in the quickfix window
    # tender-vim              # a clean dark theme
    # vim-airline             # bottom status bar
    # vim-airline-themes
    # vim-easy-align          # alignment plugin
    # vim-fish                # fish shell highlighting
    # vim-fugitive            # git plugin
    # vim-gtfo                # go to terminal or file manager
    # vim-mergetool           # git mergetool for nvim
    # vim-tmux                # syntax highlighting for tmux conf file and more
  ] ++ overriddenPlugins;

  # neovim-5 nightly stuff
  # neovim-5     = pkgs.callPackage ./dev/nightly.nix {};
in
{
  programs.neovim = {
    enable       = true;
    extraConfig  = builtins.readFile ./init.vim;
    # package      = neovim-5;
    plugins      = myVimPlugins;
    viAlias      = true;
    vimAlias     = true;
    vimdiffAlias = true;
    withNodeJs   = true; # for plugins
    withPython3  = true; # for plugins
  };

  xdg.configFile = {
    # "nvim/coc-settings.json".text = cocSettings;
    # "nvim/lua".source = ./lua;
    # "nvim/colors".source = ./colors;
    "nvim/fnl".source = ./fnl;
    "nvim/ftplugin".source = ./ftplugin;
  };
}
