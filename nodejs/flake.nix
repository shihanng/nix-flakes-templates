{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          # This overlay allows us to change nodejs version.
          # https://nixos.wiki/wiki/Node.js#Using_nodePackages_with_a_different_node_version
          olv = final: prev: {
            nodejs = prev.nodejs;
          };

          pkgs = nixpkgs.legacyPackages.${system}.extend olv;
        in
        {
          devShells.default = with pkgs;
            mkShell {
              buildInputs = [
                nodejs
                nodePackages.npm
                nodePackages.yarn
              ];

              shellHook = ''
                RCFILE=".envrc"
                grep -qxF 'layout node' $RCFILE || echo 'layout node' >> $RCFILE
              '';
            };
        }
      );
}
