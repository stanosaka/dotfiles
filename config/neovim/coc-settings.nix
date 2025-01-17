{
  "diagnostic.maxWindowWidth" = 160;
  "diagnostic.maxWindowHeight" = 30;
  "languageserver" = {
    "purescript" = {
      "command" = "purescript-language-server";
      "args" = [ "--stdio" "--config {}" ];
      "filetypes" = [ "purescript" ];
      "rootPatterns" = ["bower.json" "psc-package.json" "spago.dhall"];
    };
    "haskell" = {
      "command" = "haskell-language-server-wrapper";
      "args" = ["--lsp"];
      "rootPatterns" = [
        "*.cabal"
        "stack.yaml"
        "cabal.project"
        "package.yaml"
        "hie.yaml"
      ];
      "filetypes" = ["haskell" "lhaskell"];
    };
  };
  "typescript.autoClosingTags" = true;
}
