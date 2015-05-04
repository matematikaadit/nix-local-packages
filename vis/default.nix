{ stdenv, fetchgit, ncurses }:

stdenv.mkDerivation rec {
  revcount = "419";
  revhash = "2c84ecf";
  version = "0.r${revcount}.g${revhash}";
  name = "vis-${version}";
  src = fetchgit {
    url = https://github.com/martanne/vis.git;
    rev = revhash;
    sha256 = "c77aa03e6082a1e2446b66e6563dd9005491c014996794bb2a646aa86bedd8bb";
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
