let
  neovim-nightly-overlay = import (builtins.fetchTarball {
    url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  });
in
self: super:
{
  inherit (neovim-nightly-overlay self super) neovim-nightly;
}
