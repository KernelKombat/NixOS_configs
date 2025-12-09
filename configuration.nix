{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./application.nix
    ];

  # Bootloader.
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.loader.systemd-boot.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # AMD GPU Config
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  hardware.graphics.extraPackages = with pkgs; [
  rocmPackages.clr.icd
  ];
   hardware.graphics = {
   enable = true;
   enable32Bit = true;
  };

  networking.hostName = "nix-studio";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.supportedLocales = ["en_US.UTF-8/UTF-8" "en_IN/UTF-8"];

  environment.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
   services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.taxi = {
    isNormalUser = true;
    description = "taxi";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "render"];
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.kdenlive
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
    nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    http-connections = 64;
    max-jobs = "auto";
    cores = 0;
  };
  
   environment.shellAliases = {
    ll = "ls -la";
    la = "ls -A";
    l = "ls -CF";
    
    #nix-update = "sudo nixos-rebuild switch --upgrade";
    nix-clean = "sudo nix-collect-garbage -d && sudo nix-store --optimise";
    nix-update = "cd /etc/nixos/ && sudo nix flake update && cd && sudo nixos-rebuild switch --upgrade";
    };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  #networking.firewall.allowedTCPPorts = [ ... ];
  #networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  system.stateVersion = "25.11"; # Did you read the comment?

}
