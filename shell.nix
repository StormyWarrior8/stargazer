with (import <nixpkgs> {});
let
  version = "0.1.0.0";
  ghc = haskell.packages.ghc7103.ghcWithPackages (ps: with ps; [
          unix-compat memory network old-time
        ]);
in
haskell.lib.buildStackProject {
  name = "stargazer-${version}";
  buildInputs = [ ];
  inherit ghc;
  # ghc = haskell.packages.ghc7103.ghc;

  meta = {
  homepage        = "https://github.com/yurrriq/stargazer";
  description     = "GitHub Stargazer";
  longDescription = ''
   TODO: write this
  '';

    platforms       = stdenv.lib.platforms.unix;
    maintainers     = [ "Eric Bailey <eric@ericb.me>" ];
  };
}
