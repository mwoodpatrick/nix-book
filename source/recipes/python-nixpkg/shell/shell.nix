with (import <nixpkgs> {});
let
  customPython = python3.withPackages (ps: with ps; [ html_sanitizer ]);
in
mkShell {
  buildInputs = [
                  customPython
                ];
}
