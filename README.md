# Nix Local Packages

Nix Local Packages Repository

## Installation

    $ git clone git@github.com:matematikaadit/nix-local-packages.git
    $ ln -s /path/to/the/cloned/localpkgs ~/.nix-defexpr/local

## Usage

- Put your software derivation in the repo. See [vis/default.nix][] for
  example.
- Import it in [default.nix][] file, it's recommended to use `callPackage`
  function from `<nixpkgs>`.
- Install the derivation to your current profile using this command: `nix-env
  -iA local.packageName`.  Replace `packageName` with the real attribute
  declared in the [default.nix][].  Note that the derivation was put under
  `local` attribute since we named our link `local` in the installation
  process.
- Now, your derivation will be available in your current profile. If it
  provides an executable, it'll avaialble in your current path.

## LICENSE

The MIT License (MIT)

Copyright (c) 2015 Adit Cahya Ramadhan

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

<!--
vim:ft=markdown:sw=4:sts=4:ai:et:bs=indent,eol,start:
-->
