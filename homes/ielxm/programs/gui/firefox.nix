{
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];

    profiles =
      let
        settings = {
          "gfx.webrender.compositor" = true;
          "gfx.webrender.compositor.force-enabled" = true;
          "browser.urlbar.suggest.recentsearches" = false;
          "browser.contentblocking.category" = "strict";
          "browser.uidensity" = 1;
          "browser.compactmode.show" = true;
        };
      in
      {
        default = {
          isDefault = true;
          id = 0;
          name = "default";
          settings = settings;

        };
        novpn = {
          isDefault = false;
          id = 1;
          name = "novpn";
          settings = settings;
        };
      };

    policies = {
      # Disable useless Firefox features
      DisablePocket = true;
      DisableTelemetry = true;
      DisableMasterPasswordCreation = true;
      DisableFirefoxScreenshots = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisableProfileImport = true;
      DisableSetDesktopBackground = true;
      DisableFeedbackCommands = true;
      DisableForgetButton = true;

      HardwareAcceleration = true;
      DontCheckDefaultBrowser = true;

      BrowserDataBackup = {
        AllowBackup = false;
        AllowRestore = false;
      };

      FirefoxHome.SponsoredTopSites = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      PromptForDownloadLocation = true;
      OfferToSaveLogins = false;

      # Disable AI
      AIControls.Default.Value = "blocked";

      # Disable Auto Updates
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;

      ExtensionSettings =
        let
          moz = short: "https://addons.mozilla.org/firefox/downloads/latest/${short}/latest.xpi";
        in
        {
          "*".installation_mode = "blocked";

          "uBlock0@raymondhill.net" = {
            install_url = moz "ublock-origin";
            installation_mode = "force_installed";
            updates_disabled = true;
          };
        };
    };
  };
}
