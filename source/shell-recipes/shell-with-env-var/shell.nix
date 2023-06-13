with (import <nixpkgs> {});
mkShell {
  shellHook = ''
    export FOO="bar"
  '';
}
