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

  outputs = { self, nixpkgs, home-manager, zen-browser, sddm-astronaut-theme, stylix, ... } @ inputs:
    let
      system = "x86_64-linux";
      username = "stig";
      # Common modules shared across all ISOs
      commonModules = [
        "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix"
        ./hosts/common
        sddm-astronaut-theme.nixosModules.sddm-theme
        home-manager.nixosModules.home-manager
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
          boot.supportedFilesystems.zfs = lib.mkForce false;
          networking.networkmanager.enable = lib.mkForce true;
          environment.systemPackages = [
            zen-browser.packages.${system}.default
          ];
        })
      ];
    in {
      packages.${system} = {
        # default = self.nixosConfigurations.CosmOS-Cosmic.config.system.build.isoImage;
        CosmOS-Cosmic = self.nixosConfigurations.CosmOS-Cosmic.config.system.build.isoImage;
        CosmOS-Hyprland = self.nixosConfigurations.CosmOS-Hyprland.config.system.build.isoImage;
        CosmOS-Niri = self.nixosConfigurations.CosmOS-Niri.config.system.build.isoImage;
        CosmOS-GNOME = self.nixosConfigurations.CosmOS-GNOME.config.system.build.isoImage;
      };

      nixosConfigurations = {
        CosmOS-Cosmic = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs username; };
          modules = [
            ./hosts/CosmOS-Cosmic
            ({ }: {
              isoImage.edition = "cosmic";
            })
          ] ++ commonModules;
        };
        CosmOS-Hyprland = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs username; };
          modules = [
            ./hosts/WM-spins
            ({ lib, ... }: {
              isoImage.edition = "hyprland";
              options.hyprland.enabled = lib.mkForce true;
              options.niri.enabled = lib.mkForce false;
            })
          ] ++ commonModules;
        };
        CosmOS-Niri = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs username; };
          modules = [
            ./hosts/WM-spins
            ({ lib, ... }: {
              isoImage.edition = "niri";
              options.hyprland.enabled = lib.mkForce false;
              options.niri.enabled = lib.mkForce true;
            })
          ] ++ commonModules;
        };
        CosmOS-GNOME = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs username; };
          modules = [
            ./hosts/CosmOS-GNOME
            ({ }: {
              isoImage.edition = "gnome";
            })
          ] ++ commonModules;
        };
      };
    };
}
