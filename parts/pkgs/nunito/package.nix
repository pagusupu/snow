{pkgs}: let
  pname = "nunito";
in
  pkgs.stdenvNoCC.mkDerivation {
    inherit pname;
    version = "unstable-2022-02-16";

    src = pkgs.fetchFromGitHub {
      owner = "googlefonts";
      repo = pname;
      rev = "43d16f963c5c341c10efa0bfe7a82aa1bea8a938";
      hash = "sha256-yZ+pPLcgyWRa8i3cn1SwJUskBzUl1na2mndhok1mMok=";
    };

    dontBuild = true;
    dontConfigure = true;

    installPhase = ''
      mkdir -p $out/share/fonts/TTF
      cp -R $src/fonts/variable $out/share/fonts/TTF
    '';
  }
