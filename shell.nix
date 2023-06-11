with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    asciidoctor
    python311Packages.pygments
  ];
}
