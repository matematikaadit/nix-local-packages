{ stdenv, fetchgit, ncurses }:

stdenv.mkDerivation rec {
  rev = "860ad58";
  revcount = "445";
  version = "0.r${revcount}.g${rev}";
  name = "vis-${version}";
  src = fetchgit {
    url = https://github.com/martanne/vis.git;
    inherit rev;
    sha256 = "42c9a398ef09eda4e7044744fb5b2a7ae2a6cfa2e51608d0151bcda91425a96f";
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
