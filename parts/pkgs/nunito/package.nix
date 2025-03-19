{pkgs}: let
  pname = "nunito";
in
  pkgs.stdenvNoCC.mkDerivation {
    inherit pname;
    version = "unstable-2022-02-16";

    src = pkgs.fetchFromGitHub {
      owner = "googlefonts";
      repo = pname;
      rev = "8c6a9bb9732545b9ed53f29ec5e1ab0ff53c4e6f";
      hash = "sha256-m276Gnkwpd+MjHo4mPU1RBcTs34puao7Wi+OOEuTuI0=";
    };

    dontBuild = true;
    dontConfigure = true;

    installPhase = ''
      mkdir -p $out/share/fonts/TTF
      cp -R $src/fonts/variable $out/share/fonts/TTF
    '';
  }
