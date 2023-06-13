with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    hello
    cowsay
  ];
}
