with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    asciidoctor
    # python311Packages.pygments don't need to install, asciidoctor includes it
    # rubyPackages.coderay
    # rubyPackages.rouge
  ];
}
