{
  stdenv
, lib
, cmake
}:
  stdenv.mkDerivation rec {
    pname = "libutp";
    version = "unstable-2023.2.13";
    src = fetchGit {
      url = "https://github.com/transmission/libutp";
      rev = "420e697ac4f3d70005a85e3cfd8b022e2bd5b060";
      ref = "post-3.4-transmission";
    };
    nativeBuildInputs = [ cmake ];
    cmakeFlags = [
      "-DLIBUTP_ENABLE_INSTALL=ON"
    ];
    meta = with lib; {};
  }
