{config, builtins, ...}:

{
  programs.zsh = {
    initContent = ''
      # Idk how to ref home dir rn :(
      export PATH="$PATH:$HOME/Developer/flutter/bin"
      export PATH="$PATH:$HOME/.pub-cache/bin"
    '';
  };
}
