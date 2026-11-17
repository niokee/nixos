# Dagger CLI from the upstream release tarballs. Not in nixpkgs; hashes are the ones
# the dagger/homebrew-tap formula pins for the same version. Bump version and all
# four hashes together, from dl.dagger.io/dagger/releases/<version>/checksums.txt.
{
  lib,
  stdenvNoCC,
  fetchurl,
}: let
  version = "1.0.0-beta.24";
  releases = {
    aarch64-darwin = {
      platform = "darwin_arm64";
      sha256 = "f0b5bfe032f8d245633ee03c350fcc4ad7089bf46a1f86db0a8dddf3011ca5fc";
    };
    x86_64-darwin = {
      platform = "darwin_amd64";
      sha256 = "16b879a083b8ba0be8db80d58701e2726645adbcdd90880417991813c5133102";
    };
    x86_64-linux = {
      platform = "linux_amd64";
      sha256 = "648a5ffcf7d6d724526d20942066fd023cdf2b8284204d0ca3e1fcf6f0793f6e";
    };
    aarch64-linux = {
      platform = "linux_arm64";
      sha256 = "c6fd1d9fa53ac4880a21373411a923720cd65e6b7a05a617379278a524ee078d";
    };
  };
  release = releases.${stdenvNoCC.hostPlatform.system};
in
  stdenvNoCC.mkDerivation {
    pname = "dagger";
    inherit version;
    src = fetchurl {
      url = "https://dl.dagger.io/dagger/releases/${version}/dagger_v${version}_${release.platform}.tar.gz";
      inherit (release) sha256;
    };
    sourceRoot = ".";
    dontConfigure = true;
    dontBuild = true;
    installPhase = ''
      runHook preInstall
      install -Dm755 dagger $out/bin/dagger
      runHook postInstall
    '';
    meta = {
      description = "Programmable CI/CD engine that runs pipelines in containers";
      homepage = "https://dagger.io";
      license = lib.licenses.asl20;
      mainProgram = "dagger";
      platforms = builtins.attrNames releases;
    };
  }
