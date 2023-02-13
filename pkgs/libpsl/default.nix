{
  stdenv
, lib
, psl
, libidn2
, libunistring
, meson
, ninja
, pkg-config
}:
  stdenv.mkDerivation rec {
    pname = "libpsl";
    version = "0.21.2";
    src = fetchGit {
      url = "https://github.com/rockdaboot/libpsl";
      rev = "927b202c69bcd9be4c30ba51c74925f2575e1a69";
    };
    nativeBuildInputs = [ meson pkg-config ninja ];
    buildInputs = [
      libidn2
      libunistring
    ];
    mesonFlags = [
      "-Dbuiltin=false"
      "-Dpsl_file=${psl}/public_suffix_list.dat"
    ];
    meta = with lib; {};
  }
