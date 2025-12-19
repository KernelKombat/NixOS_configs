{  config, pkgs, stable, ...  }:

let
  myPythonEnv = stable.python3.withPackages (ps: with ps; [
      numpy
      scipy
      pandas
      torchWithRocm
      matplotlib
      seaborn
      imbalanced-learn
      scikit-learn
      statsmodels
      h5py
      numba
      joblib
      tqdm
      ipython
      jupyter
      notebook
  ]);

in{
   programs.firefox.enable = true;
   
   programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
   }; 
   
   programs.gamemode.enable = true;
   programs.gamescope.enable = true;
   
   programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };


    
   programs.appimage.enable = true;
   programs.appimage.binfmt = true;
   
   
   
   environment.systemPackages = with pkgs;[
      kitty
      hyprpaper
      hyprlock
      hypridle
      waybar
      nwg-look
      nwg-displays
      wofi
      grim
      slurp
      wl-clipboard
      cliphist            
      playerctl              
      brightnessctl        
      networkmanagerapplet
      blueman
      
      nemo
      cemu
      brave
      vscode
      vlc
      blender-hip
      gnome-disk-utility
      heroic
      obs-studio
      handbrake
      davinci-resolve
      discord
      wineWowPackages.stagingFull
      ryubing
      rpcs3
      protonvpn-gui
      protonup-qt
      spotify
      mangohud
      goverlay
      protontricks
      komikku
      onlyoffice-desktopeditors
      telegram-desktop

      amf
      amf-headers
      rocmPackages.rocminfo
      rocmPackages.rocm-smi
      radeontop
      zsh
      git
      btop-rocm
      nvtopPackages.full
      ffmpeg
      gcc
      jq
      zip
      unzip
      myPythonEnv
      neovim
      fastfetch
      unrar
      ani-cli
      clinfo
      bmon
      spotdl
      pywal
      pciutils
      usbutils
      bat
   ];

fonts = {
  enableDefaultPackages = true;
  packages = with pkgs; [
    dejavu_fonts
    jetbrains-mono
    font-awesome
    material-icons
  ];
  fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Noto Serif" "DejaVu Serif" ];
      sansSerif = [ "Noto Sans" "DejaVu Sans" ];
      monospace = [ "JetBrains Mono" "DejaVu Sans Mono" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
};
}
