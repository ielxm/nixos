{
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];

    policies = {
      DisablePocket                 = true;
      DisableTelemetry              = true;
      DisableMasterPasswordCreation = true;
      DisableFirefoxScreenshots     = true;
      DisableFirefoxAccounts        = true;
      DisableFirefoxStudies         = true;
      DisableProfileImport          = true;
      DisableSetDesktopBackground   = true;
      DisableFeedbackCommands       = true;
      DisableForgetButton           = true;

      OfferToSaveLogins             = false;
      HardwareAcceleration          = true;
      DontCheckDefaultBrowser       = true;
      PromptForDownloadLocation     = true;
      CaptivePortal                 = false;
      GenerativeAI.Enabled          = false;

      AppAutoUpdate                 = false;
      BackgroundAppUpdate           = false;

      FirefoxHome.SponsoredTopSites = false;
      AIControls.Default.Value = "blocked";
      BrowserDataBackup = {
        AllowBackup = false;
        AllowRestore = false;
      };
            
      ExtensionSettings = let
        moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
      in {
        "*".installation_mode = "blocked";

        "uBlock0@raymondhill.net" = {
          install_url       = moz "ublock-origin";
          installation_mode = "force_installed";
          updates_disabled  = true;
        };
      };
    };
  };
}
