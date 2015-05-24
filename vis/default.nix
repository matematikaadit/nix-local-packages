{ stdenv, fetchgit, ncurses }:

stdenv.mkDerivation rec {
  rev = "11129f3";
  revcount = "429";
  version = "0.r${revcount}.g${rev}";
  name = "vis-${version}";
  src = fetchgit {
    url = https://github.com/martanne/vis.git;
    inherit rev;
    sha256 = "b8fb643c7410577d77c495210f6c06d3d89dbaf92d8fec7452925cd2b5eb1e71";
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
