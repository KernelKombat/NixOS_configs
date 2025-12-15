{  config, pkgs, stable, chaotic, jovian, ...  }:

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
   
   jovian = {
    steam.enable = true;
    decky-loader.enable = true;
    hardware.has.amd.gpu = true;
    steam.desktopSession = true;
   };
  programs.steam.extraCompatPackages = with pkgs; [
    proton-ge-custom
  ];

   programs.gamemode.enable = true;
    
   programs.appimage.enable = true;
   programs.appimage.binfmt = true;
   
   services.flatpak.enable = true;
   
   programs.gamescope.enable = true;
   
   environment.systemPackages = with pkgs;[
      git
      cemu
      myPythonEnv
      neovim
      neofetch
      kitty
      brave
      vscode
      stable.vlc
      blender-hip
      gnome-disk-utility
      heroic
      obs-studio
      handbrake
      davinci-resolve
      ani-cli
      discord
      wineWowPackages.stagingFull
      ryubing
      rpcs3
      protonvpn-gui
      protonup-qt
      spotify
      jovian-chaotic.mangohud
      goverlay
      protontricks
      mangayomi
      wpsoffice
      telegram-desktop

      amf
      amf-headers
      rocmPackages.rocminfo
      rocmPackages.rocm-smi
      btop-rocm
      nvtopPackages.full
      ffmpeg
      gcc
      jq
      unrar
      spotdl
      pciutils
      usbutils
      bat

   ];

   environment.variables = {
    RUSTICL_ENABLE = "radeonsi";
  };


}
