{
  description = "Python Development Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs
    , flake-utils
    , ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        nativeBuildInputs = with pkgs; [
          python39
          poetry
          pyright
          ruff
          ruff-lsp
        ];
      in
      {
        devShells.default = pkgs.mkShell {
          inherit nativeBuildInputs;
          VIRTUAL_ENV_DISABLE_PROMPT = "1";
        };
      }
    );
}
