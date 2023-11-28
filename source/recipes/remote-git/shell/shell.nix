with (import <nixpkgs> {});
let
  hello-nix = import (builtins.fetchGit {
                                           url = "https://codeberg.org/mhwombat/hello-nix";
                                           rev = "aa2c87f8b89578b069b09fdb2be30a0c9d8a77d8";
                                         });
in
mkShell {
  buildInputs = [ hello-nix ];
}
