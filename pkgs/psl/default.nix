{
  pkgs ? import <nixpkgs> {}
, stdenv
, coreutils
, bash
}:
  derivation rec {
    name = "psl";
    version = "2023.2.12";
    src = fetchGit {
      url = "https://github.com/publicsuffix/list";
      rev = "9e8325c62adb9f7c6211cb7c4f6970a27fcb67f1";
    };
    builder = "${bash}/bin/bash";
    system = builtins.currentSystem;
    args = [
      "-c"
      ''${coreutils}/bin/mkdir "$out" && ${coreutils}/bin/cp "$src/public_suffix_list.dat" "$out"''
    ];
  }
