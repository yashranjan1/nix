{
  config,
  pkgs,
  ...
}: let
  catppuccinTmux = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "catppuccin";
    version = "2.1.3";
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "tmux";
      rev = "b2f219c00609ea1772bcfbdae0697807184743e4";
      sha256 = "sha256-Is0CQ1ZJMXIwpDjrI5MDNHJtq+R3jlNcd9NXQESUe2w=";
    };
  };
in {
  programs.tmux = {
    enable = true;
    mouse = true;
    historyLimit = 10000;

    terminal = "tmux-256color";

    shell = "${pkgs.zsh}/bin/zsh";

    plugins = [
      {
        plugin = catppuccinTmux;
        extraConfig = ''
          set -g @catppuccin_flavor "mocha"
          set -g @catppuccin_window_status_style "rounded"

          set -g status-right "#{E:@catppuccin_status_application}"
          set -ag status-right "#{E:@catppuccin_status_session}"
          set -ag status-right "#{E:@catppuccin_status_uptime}"
        '';
      }
    ];

    extraConfig = ''
      unbind %
      unbind '"'
      unbind C-p
      unbind C-o
      unbind M-p

      bind -n M-p split-window -h
      bind -n C-o split-window -v

      unbind C-h
      unbind C-l
      unbind C-j
      unbind C-k
      unbind -n C-n
      bind -n C-h select-pane -L
      bind -n C-l select-pane -R
      bind -n C-j select-pane -D
      bind -n C-k select-pane -U
      bind -n C-m new-window

      unbind C-i
      unbind C-u
      bind -n C-e next-window
      bind -n C-i previous-window

      bind-key -n C-h send-keys C-w
      bind-key -n C-l send-keys C-l

      set -as terminal-features ",*:hyperlinks"
    '';
  };
}
