{ stdenv, fetchurl, ncurses }:

stdenv.mkDerivation rec {
  version = "0.0.1+git.c6910b0";
  name = "vis-${version}";
  src = fetchurl {
    url = http://repo.or.cz/w/vis.git/snapshot/c6910b03fbc8b7978369900dc571d758de3ef844.tar.gz;
    md5 = "961b36d14c3289cd9139c167b671c835";
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
