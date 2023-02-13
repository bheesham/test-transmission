{
  stdenv
, cmake
, curl
, libb64
, libdeflate
, libdht
, libevent
, libnatpmp
, libpsl
, libutp
, miniupnpc
, openssl
, pkg-config
, python3
, systemd
}:
  stdenv.mkDerivation rec {
    pname = "transmission";
    version = "4.0";
    src = fetchGit {
      url = "https://github.com/transmission/transmission";
      rev = "280ace12f8a2b99fdf144011cd4f6fed8be876fe";
      submodules = true;
    };
    nativeBuildInputs = [
      pkg-config
      cmake
    ];
    cmakeFlags = [
      "-DUSE_SYSTEM_EVENT2=ON"
      "-DUSE_SYSTEM_DEFLATE=ON"
      "-DUSE_SYSTEM_DHT=ON"
      "-DUSE_SYSTEM_MINIUPNPC=ON"
      "-DUSE_SYSTEM_NATPMP=ON"
      "-DUSE_SYSTEM_PSL=ON"
      "-DUSE_SYSTEM_B64=ON"
      "-DUSE_SYSTEM_PSL=ON"
      "-DENABLE_CLI=ON"
    ];
    buildInputs = [
      curl
      libb64
      libdeflate
      libdht
      libevent
      libnatpmp
      libpsl
      libutp
      miniupnpc
      openssl
      python3
      systemd
    ];
  }
