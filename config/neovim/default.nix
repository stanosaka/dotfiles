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
    lualine-nvim
    neoscroll-nvim
    nvim-colorizer-lua
    nvim-web-devicons
    vim-buftabline
    vim-devicons
    # material-nvim
    # srcery-vim
    # tokyonight-nvim

    # TODO
    # indent-blankline-nvim
    # nvim-ts-rainbow
    # barbar-nvim
    # sidebar-nvim

  # UTILITY
    aniseed                          # write configs in Fennel!
    bclose-vim                       # Bclose
    camelcasemotion                  # camelCase motions
    editorconfig-vim
    fzf-vim                          # fuzzy finder
    lightspeed-nvim                  # highlights keys to move quickly
    nvim-tree-lua
    plenary-nvim                     # lua utils
    tabular                          # align code verically (haskell etc)
    telescope-fzy-native-nvim        # FIXME: what is it?
    telescope-nvim
    telescope-project-nvim           # FIXME: I don't use it
    toggleterm-nvim                  # floating termial; used only for lazygit for now
    vim-commentary                   # comment some code
    vim-repeat                       # repeat plugin commands with (.)
    vim-ripgrep                      # blazing fast search using ripgrep
    vim-sensible                     # sensible defaults
    vim-signature                    # FIXME: what is it?
    vim-surround                     # quickly edit surroundings (brackets, html tags, etc)
    which-key-nvim                   # spacemacs-like menu and key bindings
    # impatient-nvim                   # speed up loading lua modules
    # nvim-notify                      # used with `sniprun`

  # DEV
    cmp-buffer
    cmp-nvim-lsp
    cmp-path
    cmp_luasnip
    conjure                          # evaluate some LISP
    formatter-nvim
    gitsigns-nvim
    haskell-vim
    lsp-colors-nvim                  # add missing LSP highlight groups for unsupported color schemes
    luasnip
    numb-nvim                        # peek line number
    nvim-autopairs
    nvim-cmp
    nvim-lspconfig
    nvim-lsputils                    # used for code actions
    nvim-treesitter
    purescript-vim
    trouble-nvim                     # diagnostic list
    vim-css-color                    # preview css colors
    vim-easy-align
    vim-jsx-pretty
    vim-matchup
    vim-nix                          # nix support (highlighting, etc)
    vim-parinfer
    vim-solidity
    # nvim-spectre
    # sniprun                          # evaluate code snippets
    # symbols-outline-nvim             # TODO: use `aerial.nvim` instead

  # TEMP
    vim-better-sml                   # SML plugin; NOTE: only for course

  # MISC
    vimwiki                          # Notes
    neuron-nvim                      # Also notes (testing)

    # TODO check out
    # ctrlsf-vim                     # edit file in place after searching with ripgrep
    # dhall-vim                      # Syntax highlighting for Dhall lang
    # fzf-hoogle                     # search hoogle with fzf
    # ghcid                          # ghcid for Haskell
    # multiple-cursors               # Multiple cursors selection, etc
    # neomake                        # run programs asynchronously and highlight errors
    # neorg
    # nerdcommenter                  # code commenter
    # quickfix-reflector-vim         # make modifications right in the quickfix window
    # tender-vim                     # a clean dark theme
    # vim-airline                    # bottom status bar
    # vim-airline-themes
    # vim-easy-align                 # alignment plugin
    # vim-fish                       # fish shell highlighting
    # vim-fugitive                   # git plugin
    # vim-gtfo                       # go to terminal or file manager
    # vim-mergetool                  # git mergetool for nvim
    # vim-tmux                       # syntax highlighting for tmux conf file and more
  ] ++ overriddenPlugins;
in
{
  programs.neovim = {
    enable       = true;
    extraConfig  = builtins.readFile ./init.vim;
    plugins      = myVimPlugins;
    viAlias      = true;
    vimAlias     = true;
    vimdiffAlias = true;
    withNodeJs   = true;
    withPython3  = true;
  };

  xdg.configFile = {
    "nvim/fnl".source = ./fnl;
    "nvim/ftplugin".source = ./ftplugin;
  };
}
