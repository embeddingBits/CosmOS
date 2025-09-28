{
  description = "Stig's NixOS ISOs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sddm-astronaut-theme = {
      url = "github:stratos-linux/sddm-astronaut-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, sddm-astronaut-theme, stylix, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "stig";
    in {
      packages.${system} = {
        # default = self.nixosConfigurations.CosmOS-Hyprland.config.system.build.isoImage;
        CosmOS-GNOME = self.nixosConfigurations.CosmOS-GNOME.config.system.build.isoImage;
        CosmOS-Hyprland = self.nixosConfigurations.CosmOS-Hyprland.config.system.build.isoImage;
      };

      nixosConfigurations = {
        CosmOS-Hyprland = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs username; };
          modules = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix"
            ./hosts/WM-spins
            sddm-astronaut-theme.nixosModules.sddm-theme
            home-manager.nixosModules.home-manager
            {
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "/tmp/${toString self.lastModified}.bak";
              home-manager.users.${username} = import ./home/linux.nix;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                system = "x86_64-linux";
              };
            }
            ({ lib, pkgs, ... }: {
              boot.supportedFilesystems.zfs = lib.mkForce false;
              networking.networkmanager.enable = lib.mkForce true;

              environment.systemPackages = [
                zen-browser.packages.${system}.default
              ];
            })
            stylix.nixosModules.stylix
          ];
        };

        CosmOS-GNOME = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs username; };
          modules = [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix"
            ./hosts/CosmOS-GNOME
            stylix.nixosModules.stylix
            {
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "/tmp/${toString self.lastModified}.bak";
              home-manager.users.${username} = import ./home/linux.nix;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                system = "x86_64-linux";
              };
            }
            ({ lib, pkgs, ... }: {
              isoImage.edition = "gnome";
              boot.supportedFilesystems.zfs = lib.mkForce false;
              networking.networkmanager.enable = lib.mkForce true;

              environment.systemPackages = [
                zen-browser.packages.${system}.default
              ];
            })
          ];
        };
      };
    };
}
