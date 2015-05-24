with (import <nixpkgs> {});
{
  vis = callPackage ./vis {};
  surf = callPackage ./surf { webkit = webkitgtk2; };
}
