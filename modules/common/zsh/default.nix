{config, pkgs, lib, ... }:
{
  home.file = {
    ".config/ohmyposh".source = ./ohmyposh;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
    shellAliases = {
      ls = "eza";
      ll = "eza --icons=always -al";
      update = "home-manager switch";
      nix-dev = "nix develop -c $SHELL";
    };
    history.size = 10000;
    initContent = 
      let
        zshConfigBeforeInit = lib.mkOrder 500 ''
          export ZSH_DISABLE_COMPFIX=true
          export PATH="$PATH:/opt/homebrew/Cellar/binutils/2.44/bin"
          if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
              export TERM=xterm-256color
          fi
        '';
        zshConfigAfterInit = lib.mkOrder 1200 ''
          findandkill() {  
            ports=$(lsof -n -i4TCP:$1 | grep LISTEN | awk '{print $2}')  
            echo "$ports"
            for port in $ports; do 
              kill -9 $port 
            done
          }
          alias killport=findandkill
        ''; 
      in 
        lib.mkMerge [ 
          zshConfigBeforeInit
          zshConfigAfterInit
        ];
  };
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromTOML (builtins.unsafeDiscardStringContext (builtins.readFile ./ohmyposh/base.toml));
  };
}
