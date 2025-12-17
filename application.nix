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
    hardware.has.amd.gpu = true;
    steam.desktopSession = true;
   }; 

   programs.gamemode.enable = true;
    
   programs.appimage.enable = true;
   programs.appimage.binfmt = true;
   
   programs.gamescope.enable = true;
   
   environment.systemPackages = with pkgs;[
      cemu
      kitty
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
      jovian-chaotic.mangohud
      goverlay
      protontricks
      komikku
      wpsoffice
      telegram-desktop

      amf
      amf-headers
      rocmPackages.rocminfo
      rocmPackages.rocm-smi
      radeontop
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
      pciutils
      usbutils
      bat

   ];
}
