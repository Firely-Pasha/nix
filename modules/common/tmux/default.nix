{config, pkgs, lib, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    baseIndex = 1;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color"; prefix = "C-a";
    mouse = true;
    extraConfig = ''
      unbind %
      bind = split-window -h

      unbind '"'
      bind - split-window -v 

      unbind r
      bind r source-file ~/.tmux.conf

      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5

      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5

      bind -r m resize-pane -Z

      set-window-option -g mode-keys vi

      bind-key -T copy-mode-vi 'v' send -X begin-selection # start selecting text with "v"
      bind-key -T copy-mode-vi 'y' send -X copy-selection # copy text with "y"

      unbind -T copy-mode-vi MouseDragEnd1Pane # don't exit copy mode when dragging with mouse

      set -gF  status-right "#{@catppuccin_status_directory}"
      set -agF status-right "#{@catppuccin_status_user}"
      set -agF status-right "#{@catppuccin_status_host}"
      set -agF status-right "#{E:@catppuccin_status_date_time}"

      set -g @resurrect-capture-pane-contents 'on'
      set -g @continuum-restore 'on'
    '';

    plugins = with pkgs; [
      tmuxPlugins.resurrect
      tmuxPlugins.continuum
      tmuxPlugins.vim-tmux-navigator
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set -g @catppuccin_flavor 'macchiato'
          set -g @catppuccin_window_status_style 'rounded'
          set -g @catppuccin_window_number_position 'right'
          set -g @catppuccin_window_status 'no'
          set -g @catppuccin_window_default_text '#W'
          set -g @catppuccin_window_text '#W'
          set -g @catppuccin_window_current_fill 'number'
          set -g @catppuccin_window_current_text '#W'
          set -g @catppuccin_window_current_color '#{E:@thm_surface_2}'
          set -g @catppuccin_date_time_text ' %d.%m.%y %H:%M'
          set -g @catppuccin_status_module_text_bg '#{E:@thm_mantle}'

          # set left and right status bar
          set -g allow-rename off
          set -g status-interval 5
          set -g status-left-length 100
          set -g status-right-length 100
          set -g status-left '#{E:@catppuccin_status_session} '
        '';
      }
    ];
  };
}
