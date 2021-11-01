{ pkgs }:

pkgs.neovim-unwrapped.overrideAttrs (
  old: {
    name    = "neovim-v0.6.0-dev+544";
    version = "e921e98";

    src = pkgs.fetchFromGitHub {
      owner  = "neovim";
      repo   = "neovim";
      rev    = "e921e98ce38a33a824a8b4efb376a9901a8191d7";
      sha256 = "sha256-ki9cOce2HxFYVo8TZhS7jK/ESxjdDI4s/qiyyBK4EWE=";
    };

    buildInputs = old.buildInputs ++ [ pkgs.tree-sitter ];
  }
)
