_: pkgs: rec {
  haskellPackages = pkgs.haskellPackages.override (old: {
    overrides = pkgs.lib.composeExtensions (old.overrides or (_: _: { }))
      (self: super: rec {
        kotokrad-xmonad = self.callCabal2nix "kotokrad-xmonad"
          (pkgs.lib.sourceByRegex ../config/xmonad [
            "xmonad.hs"
            "kotokrad-xmonad.cabal"
          ]) { };
      });
  });
}
