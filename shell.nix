with (import <nixpkgs> {});
let
   run-code-inline = (builtins.getFlake git+https://codeberg.org/mhwombat/run-code-inline).packages.${builtins.currentSystem}.default;
in
mkShell {
  buildInputs = [
    run-code-inline
    asciidoctor
    # python311Packages.pygments don't need to install, asciidoctor includes it
    # rubyPackages.coderay
    # rubyPackages.rouge
  ];
}
