{
  description = "Scott's Nix configuration";

  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    home-packages.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.inputs.nixpkgs.follows = "home-packages";
  };

  outputs = inputs @ {
    home-manager,
    home-packages,
    ...
  }: let
    mkHomeConfiguration = {
      emailAddress,
      fullName,
      homeModule,
      hostPlatform,
      userName,
    }: let
      homeConfiguration = home-manager.lib.homeManagerConfiguration;
      packages = home-packages.legacyPackages.${hostPlatform};
    in
      homeConfiguration {
        extraSpecialArgs = {
          inherit inputs;
          inherit packages;
          settings = {
            inherit emailAddress;
            inherit fullName;
            inherit hostPlatform;
            inherit userName;
          };
        };
        modules = [homeModule];
        pkgs = packages;
      };
  in {
    homeConfigurations = {
      "scott@scott-desktop" = mkHomeConfiguration {
        emailAddress = "me@scottwillmoore.au";
        fullName = "Scott Moore";
        homeModule = ./home.nix;
        hostPlatform = "x86_64-linux";
        userName = "scott";
      };
    };
  };
}