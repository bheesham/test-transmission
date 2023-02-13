{
  pkgs ? import <nixpkgs> {}
}:
let
  overrides = rec {
    libdeflate = pkgs.callPackage ./pkgs/libdeflate {};
    psl = pkgs.callPackage ./pkgs/psl {};
    libpsl = pkgs.callPackage ./pkgs/libpsl { inherit psl; };
    libdht = pkgs.callPackage ./pkgs/libdht { inherit (pkgs) cmake; };
    libutp = pkgs.callPackage ./pkgs/libutp { inherit (pkgs) cmake; };
  };
  transmission = pkgs.callPackage ./pkgs/transmission {
    inherit (overrides) libdeflate libpsl libdht libutp;
  };
in
  transmission
