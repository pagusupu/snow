{
  pkgs,
  lib,
  ...
}: let
  pname = "downsampler-threaded";
in
  pkgs.stdenvNoCC.mkDerivation {
    inherit pname;
    version = "unstable-2024-10-25";

    src = pkgs.fetchFromGitLab {
      owner = "beep_street";
      repo = pname;
      rev = "9602afbbe15b4550e341de4a85e00a4686810ead";
      hash = "sha256-aWLG0KY8LS1tia862rQjiu1Ck0BhF1P63D2H7uUSdnk=";
    };

    buildInputs = [pkgs.bashInteractive];
    nativeBuildInputs = [pkgs.makeWrapper];

    dontBuild = true;
    dontConfigure = true;

    installPhase = ''
      install -Dm 0755 ${pname}.sh $out/bin/${pname}
      wrapProgram $out/bin/${pname} --prefix PATH : ${lib.makeBinPath (with pkgs; [
        flac
        sox
        coreutils
        gawk
        parallel
      ])}
    '';
  }
