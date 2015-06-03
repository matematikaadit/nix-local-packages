with (import <nixpkgs> {});
{
  vis = callPackage ./vis {};
  surf = callPackage ./surf { webkit = webkitgtk2; };
  go = callPackage ./go { inherit (darwin) Security; };
  dart = callPackage ./dart {};
}
