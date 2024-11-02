{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.username = "sharmapukar217";
  home.homeDirectory = "/home/sharmapukar217";

  # gc
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 5d";

  nixpkgs.config.allowUnfree = true;
  targets.genericLinux.enable = true;

  programs.ags.enable = true;
  programs.bash.enable = true;
  programs.kitty.enable = true;
  programs.zoxide.enable = true;

  programs.git = {
    enable = true;
    userName = "Pukar Sharma";
    userEmail = "sharmapukar217@gmail.com";
  };

  programs.eza = {
    enable = true;
    icons = "always";
  };

  programs.fzf = {
    enable = true;
  };

  programs.bat = {
    enable = true;
    config = {
      style = "numbers";
    };
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      batgrep
    ];
  };

  programs.tmux = {
    enable = true;
    prefix = "C-a";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      continuation_prompt = "▶▶ ";
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
      directory.truncation_symbol = "…/";
      directory.substitutions = {
        "~/dotfiles" = " ";
      };
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    defaultEditor = true;
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs; [
      vscode-extensions.esbenp.prettier-vscode
      vscode-extensions.dbaeumer.vscode-eslint
    ];
    userSettings = {
      editor.formatOnSave = true;
      files.autoSaveWhenNoErrors = true;
      files.autoSave = "onWindowChange";
      files.autoSaveWorkspaceFilesOnly = true;
      editor.formatOnSaveMode = "modificationsIfAvailable";

      editor.defaultFormatter = "esbenp.prettier-vscode";
      files.exclude = {
        "**/node_modules" = true;
      };
    };
  };

  home.packages = with pkgs; [
    discord
    google-chrome
    nixfmt-rfc-style
    fira-code-nerdfont
    gnomeExtensions.caffeine
  ];

  home.file = {
    #
  };

  home.shellAliases = {
    hsw = "home-manager switch -b backup --flake ~/dotfiles/home-manager";
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
