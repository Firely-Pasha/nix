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
      os-rebuild = "sudo nixos-rebuild switch --flake";
      update = "home-manager switch";
    };
    history.size = 10000;
    initExtra = ''
      eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/base.toml)"

      findandkill() {  
        ports=$(lsof -n -i4TCP:$1 | grep LISTEN | awk '{print $2}')  
        echo "$ports"
        for port in $ports; do 
          kill -9 $port 
        done
      }
      alias killport=findandkill
    '';
  };
  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    # settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile "/share/oh-my-posh/themes/space.omp.json"));
    # settings = "./dotfiles/.config/ohmyposh/base.json";
  };
}
