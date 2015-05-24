{stdenv, fetchgit, makeWrapper, gtk, webkit, pkgconfig, glib, glib_networking, libsoup, gsettings_desktop_schemas, patches ? null}:

stdenv.mkDerivation rec {
  rev = "b4ca032";
  version = "0.6";
  name = "surf-${version}.g${rev}";

  src = fetchgit {
    url = http://git.suckless.org/surf;
    inherit rev;
    sha256 = "cddb4136b9fbb6d3ea0bca9d9759a6d49fde775e0a6e4faf9b5448c854a61fc3";
  };

  buildInputs = [ gtk makeWrapper webkit gsettings_desktop_schemas pkgconfig glib libsoup ];

  # Allow users set their own list of patches
  inherit patches;

  buildPhase = " make ";

# `-lX11' to make sure libX11's store path is in the RPATH
  NIX_LDFLAGS = "-lX11";
  preConfigure = [ ''sed -i "s@PREFIX = /usr/local@PREFIX = $out@g" config.mk'' ];
  installPhase = ''
    make PREFIX=/ DESTDIR=$out install
  '';

  preFixup = ''
    wrapProgram "$out/bin/surf" \
      --prefix GIO_EXTRA_MODULES : ${glib_networking}/lib/gio/modules \
      --prefix XDG_DATA_DIRS : "$GSETTINGS_SCHEMAS_PATH"
  '';

  meta = {
    description = "Simple web browser";
    longDescription = ''
      Surf is a simple web browser based on WebKit/GTK+. It is able to display
      websites and follow links. It supports the XEmbed protocol which makes it
      possible to embed it in another application. Furthermore, one can point
      surf to another URI by setting its XProperties.
      '';
    homepage = http://surf.suckless.org;
    license = stdenv.lib.licenses.mit;
    platforms = stdenv.lib.platforms.linux;
  };
}
