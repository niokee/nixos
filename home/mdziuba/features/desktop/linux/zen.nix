{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.beta
    # or inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser = {
    enable = true;
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
    profiles.mdziuba.extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
      tabliss
      onepassword-password-manager
      onetab
      decentraleyes
      darkreader
      clearcache
      privacy-badger
      sponsorblock
      ublock-origin
      undoclosetabbutton
      youtubeno-translation
      dearrow
    ];
    profiles.mdziuba.settings = {
      "accessibility.typeaheadfind.flashBar" = 0;
      "browser.contentblocking.category" = "standard";
      "browser.search.region" = "PL";
      "browser.tabs.inTitlebar" = 1;
      "browser.tabs.unloadOnLowMemory" = false;
      "browser.urlbar.tabToSearch.onboard.interactionsLeft" = 2;
      "browser.urlbar.placeholderName" = "Google";
      "browser.urlbar.quicksuggest.scenario" = "history";
      "browser.urlbar.placeholderName.private" = "Google";
      "dom.forms.autocomplete.formautofill" = true;
      "dom.security.https_only_mode_ever_enabled" = true;
      "font.name.monospace.x-western" = "FiraCode Nerd Font Mono";
      "font.name.sans-serif.x-western" = "Noto Sans Adlam";
      "font.name.serif.x-western" = "Noto Serif Ahom";
      "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
      "media.videocontrols.picture-in-picture.video-toggle.has-used" = true;
      "privacy.bounceTrackingProtection.hasMigratedUserActivationData" = true;
      "privacy.clearHistory.formdata" = true;
      "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = false;
      "privacy.clearOnShutdown_v2.cache" = false;
      "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
      "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = false;
      "privacy.clearSiteData.browsingHistoryAndDownloads" = true;
      "privacy.clearSiteData.formdata" = true;
      "privacy.clearSiteData.siteSettings" = true;
      "privacy.globalprivacycontrol.was_ever_enabled" = true;
      "privacy.history.custom" = true;
      "services.sync.engine.creditcards" = true;
      "services.sync.engine.prefs.modified" = false;
      "signon.rememberSignons" = false;
      "signon.rustMirror.migrationNeeded" = true;

      "browser.tabs.groups.hoverPreview.enabled" = false;
      "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
      "browser.urlbar.quicksuggest.enabled" = false;
      "browser.urlbar.suggest.topsites" = true;
      "browser.urlbar.suggest.quicksuggest.sponsored" = false;
      "extensions.formautofill.creditCards.os-auth.locked.enabled" = false;
      "fission.autostart.session" = true;
      "image.avif.enabled" = true;
      "image.jxl.enabled" = true;
      "media.utility-process.enabled" = true;
      "media.videocontrols.picture-in-picture.urlbar-button.enabled" = true;
      "signon.management.page.os-auth.locked.enabled" = false;
    };
  };
}
