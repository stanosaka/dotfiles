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

  material-nvim = buildVimPlugin {
    name = "material-nvim";
    src = builtins.fetchTarball {
      name   = "material-nvim-f8e663a";
      url    = "https://github.com/marko-cerovac/material.nvim/archive/f8e663a.tar.gz";
      sha256 = "0wvcc8x9k1mpi2xgdk1ll571h5cbf8kx6jcs1cabkrf5s28mf9rb";
    };
  };

#   melange = buildVimPlugin {
#     name = "melange";
#     src = builtins.fetchTarball {
#       name   = "melange-a7f6cc4";
#       url    = "https://github.com/savq/melange/archive/a7f6cc4.tar.gz";
#       sha256 = "sha256:1y4l47v563zknif37hsyvkq4bn918r8swnrsnykljgy95vs3p53a";
#     };
#     nativeBuildInputs = [ pkgs.neovim ];
#   };

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

#   stabilize-nvim = buildVimPlugin {
#     name = "stabilize-nvim";
#     src = builtins.fetchTarball {
#       name   = "stabilize-nvim-c38a133";
#       url    = "https://github.com/luukvbaal/stabilize.nvim/archive/c38a133.tar.gz";
#       sha256 = "sha256:1wighg1wf388kw9c8g7ykv0nmssqw7x3jalb7qvmsw05fppd4aal";
#     };
#   };

  # impatient-nvim = buildVimPlugin {
  #   name = "impatient-nvim";
  #   src = builtins.fetchTarball {
  #     name   = "impatient-nvim-561b86e";
  #     url    = "https://github.com/lewis6991/impatient.nvim/archive/561b86e.tar.gz";
  #     sha256 = "01yx763h5mc5fxdzyyhw8p8hq3l66m7spdqw2dyb83n78b6l11m6";
  #   };
  #   nativeBuildInputs = [ pkgs.git ];
  # };
}
