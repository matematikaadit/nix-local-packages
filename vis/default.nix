{ stdenv, fetchurl, ncurses }:

stdenv.mkDerivation rec {
  version = "0.0.1+6.git.9d001da";
  name = "vis-${version}";
  src = fetchurl {
    url = http://repo.or.cz/w/vis.git/snapshot/9d001dabd161c6db3c631bd34712111fbf7ea942.tar.gz;
    sha256 = "0v5ck8cr5aycl6ycic7b70nfwva2s0mcylvmmh08x9xagb9d8zv5";
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
