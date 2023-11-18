with (import <nixpkgs> {});
let
  customGhc = haskellPackages.ghcWithPackages (pkgs: with pkgs; [ containers ]);
in
mkShell {
  buildInputs = [
                  customGhc
                ];
}
