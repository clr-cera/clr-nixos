# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, lib, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./desktop/nvidia.nix
    ];

  # Bootloader.
  boot.loader = {
	efi.canTouchEfiVariables = true;
	efi.efiSysMountPoint = "/boot";
	
	grub = {
	  devices = [ "nodev" ];
	  efiSupport = true;
	  enable = true;
	  useOSProber = true;
	  configurationLimit = 5;
	};
  };

  networking.hostName = "muse"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  #Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  #Sound
  sound.enable = true;
  services.pipewire = {
	enable = true;
	alsa.enable = true;
	pulse.enable = true;
	jack.enable = true;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "zh_TW.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # User
  users.users.nix = {
    isNormalUser = true;
    description = "nix";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Settings
  nix = {
    registry = lib.mapAttrs (_: value: {flake = value; }) inputs;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {	
  	experimental-features = "nix-command flakes";
	auto-optimise-store = true;
    };

    gc = {
	automatic = true;
	dates = "weekly";
	options = "--delete-older-than 2d";


    };
  };


  #Gnome keyring
  services.gnome.gnome-keyring.enable = true;
  services.passSecretService.enable = true;

  # List services that you want to enable:
  services.xserver = {
	enable = true;
	excludePackages = with pkgs; [
		xterm
	];


	displayManager = {
		lightdm = {
			enable = true;
			greeters.slick ={
				enable = true;
			};	
		};

		defaultSession = "none+awesome";		
	};
	windowManager.awesome = {
		enable = true;
		luaModules = with pkgs.luaPackages; [
			luarocks
			luadbi-mysql
		];	
	};
  };

  nixpkgs.config.permittedInsecurePackages = [
  	"openssl-1.1.1u"
  ];

  #Gnome virtual file system for auto mount of pen drive
  services.gvfs.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
