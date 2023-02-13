{
  pkgs ? import <nixpkgs> {}
, stdenv
}:
  stdenv.mkDerivation rec {
    pname = "libdeflate";
    version = "1.19";
    src = fetchGit {
      url = "https://github.com/ebiggers/libdeflate";
      rev = "bd925ae68e99f65d69f20181cb845aaba5c8f098";
    };
    nativeBuildInputs = [ pkgs.cmake ];
  }
