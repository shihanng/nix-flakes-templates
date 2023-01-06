{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          # https://raw.githubusercontent.com/NixOS/nixpkgs/master/pkgs/top-level/all-packages.nix
          # https://github.com/NixOS/nixpkgs/blob/nixos-22.11/pkgs/applications/networking/cluster/terraform/default.nix#L54
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          devShells.default = with pkgs;
            mkShell {
              buildInputs = [
                (pkgs.mkTerraform
                  {
                    version = "0.15.5";
                    sha256 = "18f4a6l24s3cym7gk40agxikd90i56q84wziskw1spy9rgv2yx6d";
                    vendorSha256 = "sha256-oFvoEsDunJR4IULdGwS6nHBKWEgUehgT+nNM41W/GYo=";
                  })
              ];
            };
        }
      );
}
