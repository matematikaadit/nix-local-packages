{ stdenv, fetchzip }:

assert stdenv.system == "x86_64-linux" || stdenv.system == "i686-linux";

stdenv.mkDerivation {
    name = "dart-1.10.1";
    src =
    if stdenv.system == "i686-linux" then
      fetchzip {
        url = https://storage.googleapis.com/dart-archive/channels/stable/release/45692/sdk/dartsdk-linux-ia32-release.zip;
        sha256 = "1sdmqng6a2czdlgxjmdfhq1hi6nqinlzflxhfvrf70d7zjf8b7zx";
      }
    else
      fetchzip {
        url = https://storage.googleapis.com/dart-archive/channels/stable/release/45692/sdk/dartsdk-linux-x64-release.zip;
        sha256 = "0i6galcngq27v090rbvwkw3mr0cvp408y86xfksag2yjmy2v6y2a";
    };
    installPhase = ''
      mkdir -p $out
      cp -R * $out/
      echo $libPath
      patchelf --interpreter "${stdenv.glibc}/lib/${stdenv.gcc.dynamicLinker}" \
        --set-rpath $libPath \
        $out/bin/dart
    '';
    libPath = stdenv.lib.makeLibraryPath [ stdenv.gcc.gcc ];
    dontStrip = true;
}
