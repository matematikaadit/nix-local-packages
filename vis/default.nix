{ stdenv, fetchurl, ncurses }:

stdenv.mkDerivation rec {
  version = "0.0.1+2.git.1540d03";
  name = "vis-${version}";
  src = fetchurl {
    url = http://repo.or.cz/w/vis.git/snapshot/1540d03c9745bbde26e46722782d618b4345c903.tar.gz;
    sha256 = "1vh2szz6x69mxhjk5vsf361bf0glwg1clmrvw3b6c81dmz5p9753";
  };
  buildInputs = [ ncurses ];
  installFlags = "PREFIX=$(out)";
  meta = {
    description = "a vim like text editor";
    longDescription = "vis is a highly efficient vim like text editor.";
    homepage = http://repo.or.cz/w/vis.git;
    license = stdenv.lib.licenses.isc;
  };
}
