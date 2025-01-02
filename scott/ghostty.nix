{
  imports = [ ./ghostty.module.nix ];

  programs.ghostty = {
    enable = true;

    config = {
      font-family = "Iosevka";
      font-size = 16;

      font-codepoint-map = "${
        builtins.concatStringsSep "," [
          "U+23FB-U+23FE"
          "U+2665"
          "U+26A1"
          "U+2B58"
          "U+E000-U+E00A"
          "U+E0A0-U+E0A2"
          "U+E0A3"
          "U+E0B0-U+E0B3"
          "U+E0B4-U+E0C8"
          "U+E0CA"
          "U+E0CC-U+E0D7"
          "U+E200-U+E2A9"
          "U+E300-U+E3E3"
          "U+E5FA-U+E6B7"
          "U+E700-U+E8EF"
          "U+EA60-U+EC1E"
          "U+ED00-U+EFCE"
          "U+F000-U+F2FF"
          "U+F300-U+F381"
          "U+F400-U+F533"
          "U+F500-U+FD46"
          "U+F0001-U+F1AF0"
        ]
      }=Symbols Nerd Font Mono";

      theme = "dark:tokyonight,light:tokyonight-day";
      window-theme = "ghostty";

      resize-overlay = "never";
    };
  };
}