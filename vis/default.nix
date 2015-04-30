{ stdenv, fetchgit, ncurses }:

stdenv.mkDerivation rec {
  version = "0.r416.g287521c";
  name = "vis-${version}";
  src = fetchgit {
    url = https://github.com/martanne/vis.git;
    rev = "287521c";
    sha256 = "b72fb7d1e5313627e89131e4fc0104edbc93c93115d73e83abdba1357f63dfc2";
  };
  makeFlags = "VERSION=$(version) PREFIX=$(out)";
  buildInputs = [ ncurses ];
  meta = {
    description = "a vim like text editor";
    longDescription = "vis is a highly efficient vim like text editor.";
    homepage = http://repo.or.cz/w/vis.git;
    license = stdenv.lib.licenses.isc;
  };
}
