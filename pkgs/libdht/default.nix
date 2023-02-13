{
  cmake
, stdenv
, lib
}:
  stdenv.mkDerivation rec {
    pname = "libdht";
    version = "unstable-2023.2.13";
    src = fetchGit {
      url = "https://github.com/transmission/dht";
      rev = "015585510e402a057ec17142711ba2b568b5fd62";
      ref = "post-0.27-transmission";
    };
    nativeBuildInputs = [ cmake ];
    meta = with lib; {};
  }
