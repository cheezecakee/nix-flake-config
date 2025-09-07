{ config, pkgs, ... }:

let
  zenBrowser = pkgs.appimageTools.wrapType2 {
    pname = "zen-browser";
    version = "1.0.0";
    src = pkgs.fetchurl {
      url = "https://github.com/zen-browser/desktop/releases/latest/download/zen-x86_64.AppImage";
      sha256 = "1g9c33gi2aa71x66k3xfr4gfcz7x01i56dxavxzzf0hija2w8dch";
    };

    extraPkgs = pkgs: with pkgs; [
      # Add any additional dependencies zen-browser might need
    ];

    extraInstallCommands = ''
      # Create desktop entry
      mkdir -p $out/share/applications
      cat > $out/share/applications/zen-browser.desktop << EOF
      [Desktop Entry]
      Name=Zen Browser
      GenericName=Web Browser
      Exec=$out/bin/zen-browser %U
      Icon=zen-browser
      Type=Application
      StartupNotify=true
      Categories=Network;WebBrowser;
      MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;
      StartupWMClass=zen-alpha
      EOF
    '';
  };
in
{
  environment.systemPackages = [ zenBrowser ];

  # Optional: Environment variables for better Wayland support
  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_USE_XINPUT2 = "1";
    MOZ_WEBRENDER = "1";
  };
}

