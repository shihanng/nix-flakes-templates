{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          pyPkgs = pkgs.python310Packages;
        in
        {
          devShells.default = with pkgs;
            mkShell {
              buildInputs = [
                pyPkgs.python
                poetry
              ];
            };
        }
      );
}
