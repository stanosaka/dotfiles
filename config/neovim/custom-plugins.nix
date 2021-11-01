{ pkgs, buildVimPlugin, fetchFromGitHub, rustPlatform }:

{
  vim-buftabline = buildVimPlugin {
    name = "asyncrun-vim";
    src = builtins.fetchTarball {
      name   = "Buftabline-73b9ef5";
      url    = "https://github.com/ap/vim-buftabline/archive/73b9ef5.tar.gz";
      sha256 = "1vs4km7fb3di02p0771x42y2bsn1hi4q6iwlbrj0imacd9affv5y";
    };
  };

  vim-ripgrep = buildVimPlugin {
    name = "vim-ripgrep";
    src = builtins.fetchTarball {
      name   = "RipGrep-v1.0.2";
      url    = "https://github.com/jremmen/vim-ripgrep/archive/v1.0.2.tar.gz";
      sha256 = "1by56rflr0bmnjvcvaa9r228zyrmxwfkzkclxvdfscm7l7n7jnmh";
    };
  };

  vim-better-sml = buildVimPlugin {
    name = "vim-better-sml";
    src = builtins.fetchTarball {
      name   = "vim-better-sml-1f36431";
      url    = "https://github.com/jez/vim-better-sml/archive/1f36431.tar.gz";
      sha256 = "0v5wbbjxz7k3ifpnl5l06zkwp3wfcs52bzwhs9i89f9g1wkkgq74";
    };
    nativeBuildInputs = [ pkgs.mlton ];
  };

  vim-submode = buildVimPlugin {
    name = "vim-submode";
    src = builtins.fetchTarball {
      name   = "vim-submode-d29de4f";
      url    = "https://github.com/kana/vim-submode/archive/d29de4f.tar.gz";
      sha256 = "sha256:1qf0ryyjbv3yw916dnvqlzqvpskg2sbkwn46a2zph71p16sg6cp7";
    };
  };

  janet-vim = buildVimPlugin {
    name = "janet-vim";
    src = builtins.fetchTarball {
      name   = "janet-vim-294538b";
      url    = "https://github.com/janet-lang/janet.vim/archive/294538b.tar.gz";
      sha256 = "sha256:1x81n4sdxza5hx3fg2pnzkj4f1sv87i7spldg8rsqpglx7da4clx";
    };
    nativeBuildInputs = [ pkgs.janet ];
  };

  parinfer-rust =
  let
    parinfer-src = builtins.fetchTarball {
      name   = "parinfer-rust-b6d5d1c";
      url    = "https://github.com/eraserhd/parinfer-rust/archive/b6d5d1c.tar.gz";
      sha256 = "sha256:04n9lz9r0kcayy0aynrwk3vffr8hdhx13zr05qsk0j679jizh8ks";
    };
    parinfer-rust-bin = rustPlatform.buildRustPackage rec {
      name = "parinfer-rust-bin";
      pname = "parinfer-rust-bin";
      src = parinfer-src;
      cargoSha256 = "sha256-zQ+ZtpJLYYFTxsPtUaaxPMoQIGtQytVY581WD31m2/E=";
      # doCheck = false;
    };
  in
  buildVimPlugin {
    name = "parinfer-rust";
    src = parinfer-src;
    buildPhase = ''
      mkdir -p ./target/release
      ln -s ${parinfer-rust-bin}/bin/parinfer-rust ./target/release/
      ln -s ${parinfer-rust-bin}/lib/libparinfer_rust.so ./target/release/
    '';
  };

#   sniprun =
#   let
#     sniprun-bin = rustPlatform.buildRustPackage rec {
#       pname = "sniprun";
#       version = "v1.0.0";
#       src = fetchFromGitHub {
#         owner = "michaelb";
#         repo = pname;
#         rev = version;
#         sha256 = "sha256-ggGwn0aVc3aa0VC4oPrG+cMlAIhsWZoEYVhnKFXkh0Y=";
#       };
#       cargoSha256 = "sha256-8c3atAQxr04p9XUoqGqeVguKdwT9vVBidY6NlDjKITU=";
#       doCheck = false;
#     };
#   in buildVimPlugin {
#     name = "sniprun";
#     src = builtins.fetchTarball {
#       name   = "sniprun-a42fa2f";
#       url    = "https://github.com/michaelb/sniprun/archive/a42fa2f.tar.gz";
#       sha256 = "0q1jw6dh2rxl61zis1dlcjbydizz05kkg8cqhwyldhdryybxnc64";
#     };
#     buildPhase = ''
#       mkdir -p target/release
#       ln -s ${sniprun-bin}/bin/sniprun target/release/sniprun
#     '';
#   };

}
