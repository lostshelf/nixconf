{ self, inputs, ... }: {
  flake.homeModules.plasmaConfig = { pkgs, ... }: {
    imports = [ inputs.plasma-manager.homeModules.plasma-manager ];
    programs.plasma = {
      enable = true;
      overrideConfig = false;
      input = {
        keyboard = {
          repeatDelay = 300;
          repeatRate = 50;
          options = [ "compose:ralt" ];
        };
        mice = [
          # Wireless
          {
            enable = true;
            name = "Logitech PRO X 2";
            vendorId = "046d";
            productId = "40a9";
            leftHanded = false;
            middleButtonEmulation = false;
            acceleration = 0.4;
            accelerationProfile = "none";
            naturalScroll = false;
            scrollSpeed = 1;
          }
          # Dongle
          {
            enable = true;
            name = "Logitech PRO X 2";
            vendorId = "046d";
            productId = "c09b";
            leftHanded = false;
            middleButtonEmulation = false;
            acceleration = 0.2;
            accelerationProfile = "none";
            naturalScroll = false;
            scrollSpeed = 1;
          }
        ];
      };
      kwin = {
        effects = {
          shakeCursor.enable = false;
          translucency.enable = true;
          blur.enable = true;
          hideCursor.enable = false;
          zoom.enable = false;
          magnifier.enable = false;
        };
        edgeBarrier = 0;
        scripts = {

        };
      };
      workspace = {
        lookAndFeel = "org.kde.breezedark.desktop";
        tooltipDelay = 5;
      };
      krunner = {
        position = "center";
        activateWhenTypingOnDesktop = true;
        historyBehavior = "enableAutoComplete";
        shortcuts.launch = "Meta+Space";
      };
      panels = [
        {
          location = "bottom";
          screen = "all";
          hiding = "none";
          floating = true;
          alignment = "center";
          widgets = [
            {
              kickoff = {
                icon = "nix-snowflake";
                popupHeight = 700;
                popupWidth = 500;
              };
            }
            {
              iconTasks = {
                launchers = [
                  "applications:firefox.desktop"
                  "applications:discord-canary.desktop"
                  "applications:org.kde.dolphin.desktop"
                  "applications:org.kde.konsole.desktop"
                  "applications:kdesystemsettings.desktop"
                  "applications:steam.desktop"
                ];
              };
            }
            {
              panelSpacer = {
                expanding = true;
              };
            }
            {
              systemTray = {
                items = {
                  showAll = false;
                  hidden = [

                  ];
                  shown = [
                    "org.kde.plasma.volume"
                    "org.kde.plasma.bluetooth"
                    "org.kde.plasma.brightness"
                    "org.kde.kdeconnect"
                    "org.kde.plasma.networkmanagement"
                    "org.kde.plasma.battery"
                    "org.kde.plasma.clipboard"
                    "org.kde.plasma.notifications"
                    "org.kde.plasma.weather"
                    "org.kde.plasma.battery"
                    "org.kde.plasma.brightness"
                  ];
                  extra = [
                    "org.kde.plasma.kclock_1x2"
                    "org.kde.plasma.vault"
                    "org.kde.plasma.mediacontroller"
                    "org.kde.plasma.manage-inputmethod"
                    "org.kde.plasma.devicenotifier"
                    "org.kde.plasma.cameraindicator"
                    "org.kde.plasma.keyboardindicator"
                    "org.kde.plasma.printmanager"
                    "org.kde.plasma.volume"
                    "org.kde.plasma.bluetooth"
                    "org.kde.plasma.brightness"
                    "org.kde.kdeconnect"
                    "org.kde.plasma.networkmanagement"
                    "org.kde.plasma.battery"
                    "org.kde.plasma.clipboard"
                    "org.kde.plasma.notifications"
                    "org.kde.plasma.weather"
                  ];
                  configs = [

                  ];
                };
              };
            }
            {
              digitalClock = {
                font = {
                  family = "Noto sans";
                  bold = true;
                  size = 12;
                  weight = 500;
                };
                date = {
                  enable = true;
                  format = { custom = "ddd. MMM. dd, yyyy"; };
                  position = "belowTime";
                };
                time = {
                  format = "12h";
                  showSeconds = "onlyInTooltip";
                };
              };
            }
            "org.kde.plasma.showdesktop"
          ];
        }
      ];

      shortcuts = {
        ActivityManager.switch-to-activity-790474b2-8553-4f1d-823a-ca179b01e23d = [ ];
        "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
        "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";
        kaccess."Toggle Screen Reader On and Off" = "Meta+Alt+S";
        kmix.decrease_microphone_volume = "Microphone Volume Down";
        kmix.decrease_volume = "Volume Down";
        kmix.decrease_volume_small = "Shift+Volume Down";
        kmix.increase_microphone_volume = "Microphone Volume Up";
        kmix.increase_volume = "Volume Up";
        kmix.increase_volume_small = "Shift+Volume Up";
        kmix.mic_mute = ["Microphone Mute" "Meta+Volume Mute"];
        kmix.mute = "Volume Mute";
        kmix.push_to_talk = [ ];
        ksmserver."Halt Without Confirmation" = [ ];
        ksmserver."Lock Session" = ["Screensaver" "Meta+L"];
        ksmserver."Log Out" = "Ctrl+Alt+Del";
        ksmserver."Log Out Without Confirmation" = [ ];
        ksmserver.LogOut = [ ];
        ksmserver.Reboot = [ ];
        ksmserver."Reboot Without Confirmation" = [ ];
        ksmserver."Shut Down" = [ ];
        kwin."Activate Window Demanding Attention" = "Meta+Ctrl+A";
        kwin."Cycle Overview" = [ ];
        kwin."Cycle Overview Opposite" = [ ];
        kwin."Decrease Opacity" = [ ];
        kwin."Edit Tiles" = "Meta+T";
        kwin.Expose = ["Ctrl+F9" "Meta+F9"];
        kwin.ExposeAll = ["Launch (C)" "Ctrl+F10" "Meta+F10"];
        kwin.ExposeClass = ["Ctrl+F7" "Meta+F7"];
        kwin.ExposeClassCurrentDesktop = [ ];
        kwin."Grid View" = "Meta+G";
        kwin."Increase Opacity" = [ ];
        kwin."Kill Window" = "Meta+Ctrl+Esc";
        kwin."Move Tablet to Next LogicalOutput" = [ ];
        kwin.MoveMouseToCenter = "Meta+F6";
        kwin.MoveMouseToFocus = "Meta+F5";
        kwin.MoveZoomDown = [ ];
        kwin.MoveZoomLeft = [ ];
        kwin.MoveZoomRight = [ ];
        kwin.MoveZoomUp = [ ];
        kwin.Overview = "Meta+W";
        kwin."Setup Window Shortcut" = [ ];
        kwin."Show Desktop" = "Meta+D";
        kwin."Switch One Desktop Down" = "Meta+Ctrl+Down";
        kwin."Switch One Desktop Up" = "Meta+Ctrl+Up";
        kwin."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
        kwin."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
        kwin."Switch Window Down" = "Meta+Alt+Down";
        kwin."Switch Window Left" = "Meta+Alt+Left";
        kwin."Switch Window Right" = "Meta+Alt+Right";
        kwin."Switch Window Up" = "Meta+Alt+Up";
        kwin."Switch to Desktop 1" = ["Ctrl+F1" "Meta+F1"];
        kwin."Switch to Desktop 10" = [ ];
        kwin."Switch to Desktop 11" = [ ];
        kwin."Switch to Desktop 12" = [ ];
        kwin."Switch to Desktop 13" = [ ];
        kwin."Switch to Desktop 14" = [ ];
        kwin."Switch to Desktop 15" = [ ];
        kwin."Switch to Desktop 16" = [ ];
        kwin."Switch to Desktop 17" = [ ];
        kwin."Switch to Desktop 18" = [ ];
        kwin."Switch to Desktop 19" = [ ];
        kwin."Switch to Desktop 2" = ["Ctrl+F2" "Meta+F2"];
        kwin."Switch to Desktop 20" = [ ];
        kwin."Switch to Desktop 21" = [ ];
        kwin."Switch to Desktop 22" = [ ];
        kwin."Switch to Desktop 23" = [ ];
        kwin."Switch to Desktop 24" = [ ];
        kwin."Switch to Desktop 25" = [ ];
        kwin."Switch to Desktop 3" = ["Ctrl+F3" "Meta+F3"];
        kwin."Switch to Desktop 4" = ["Ctrl+F4" "Meta+F4"];
        kwin."Switch to Desktop 5" = [ ];
        kwin."Switch to Desktop 6" = [ ];
        kwin."Switch to Desktop 7" = [ ];
        kwin."Switch to Desktop 8" = [ ];
        kwin."Switch to Desktop 9" = [ ];
        kwin."Switch to Next Desktop" = [ ];
        kwin."Switch to Next Screen" = [ ];
        kwin."Switch to Previous Desktop" = [ ];
        kwin."Switch to Previous Screen" = [ ];
        kwin."Switch to Screen 0" = [ ];
        kwin."Switch to Screen 1" = [ ];
        kwin."Switch to Screen 2" = [ ];
        kwin."Switch to Screen 3" = [ ];
        kwin."Switch to Screen 4" = [ ];
        kwin."Switch to Screen 5" = [ ];
        kwin."Switch to Screen 6" = [ ];
        kwin."Switch to Screen 7" = [ ];
        kwin."Switch to Screen Above" = [ ];
        kwin."Switch to Screen Below" = [ ];
        kwin."Switch to Screen to the Left" = [ ];
        kwin."Switch to Screen to the Right" = [ ];
        kwin."Toggle Night Color" = [ ];
        kwin."Toggle Window Raise/Lower" = [ ];
        kwin."Walk Through Windows" = ["Alt+Tab" "Meta+Tab"];
        kwin."Walk Through Windows (Reverse)" = ["Alt+Shift+Tab" "Meta+Shift+Tab"];
        kwin."Walk Through Windows Alternative" = [ ];
        kwin."Walk Through Windows Alternative (Reverse)" = [ ];
        kwin."Walk Through Windows of Current Application" = ["Alt+`" "Meta+`"];
        kwin."Walk Through Windows of Current Application (Reverse)" = ["Alt+~" "Meta+~"];
        kwin."Walk Through Windows of Current Application Alternative" = [ ];
        kwin."Walk Through Windows of Current Application Alternative (Reverse)" = [ ];
        kwin."Window Above Other Windows" = [ ];
        kwin."Window Below Other Windows" = [ ];
        kwin."Window Close" = "Alt+F4";
        kwin."Window Custom Quick Tile Bottom" = [ ];
        kwin."Window Custom Quick Tile Left" = [ ];
        kwin."Window Custom Quick Tile Right" = [ ];
        kwin."Window Custom Quick Tile Top" = [ ];
        kwin."Window Fullscreen" = [ ];
        kwin."Window Grow Horizontal" = [ ];
        kwin."Window Grow Vertical" = [ ];
        kwin."Window Lower" = [ ];
        kwin."Window Maximize" = "Meta+PgUp";
        kwin."Window Maximize Horizontal" = [ ];
        kwin."Window Maximize Vertical" = [ ];
        kwin."Window Minimize" = "Meta+PgDown";
        kwin."Window Move" = [ ];
        kwin."Window Move Center" = [ ];
        kwin."Window No Border" = [ ];
        kwin."Window On All Desktops" = [ ];
        kwin."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
        kwin."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
        kwin."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
        kwin."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
        kwin."Window One Screen Down" = [ ];
        kwin."Window One Screen Up" = [ ];
        kwin."Window One Screen to the Left" = [ ];
        kwin."Window One Screen to the Right" = [ ];
        kwin."Window Operations Menu" = "Alt+F3";
        kwin."Window Pack Down" = [ ];
        kwin."Window Pack Left" = [ ];
        kwin."Window Pack Right" = [ ];
        kwin."Window Pack Up" = [ ];
        kwin."Window Quick Tile Bottom" = "Meta+Down";
        kwin."Window Quick Tile Bottom Left" = [ ];
        kwin."Window Quick Tile Bottom Right" = [ ];
        kwin."Window Quick Tile Left" = "Meta+Left";
        kwin."Window Quick Tile Right" = "Meta+Right";
        kwin."Window Quick Tile Top" = "Meta+Up";
        kwin."Window Quick Tile Top Left" = [ ];
        kwin."Window Quick Tile Top Right" = [ ];
        kwin."Window Raise" = [ ];
        kwin."Window Resize" = [ ];
        kwin."Window Restore" = "Meta+Backspace";
        kwin."Window Shrink Horizontal" = [ ];
        kwin."Window Shrink Vertical" = [ ];
        kwin."Window to Desktop 1" = [ ];
        kwin."Window to Desktop 10" = [ ];
        kwin."Window to Desktop 11" = [ ];
        kwin."Window to Desktop 12" = [ ];
        kwin."Window to Desktop 13" = [ ];
        kwin."Window to Desktop 14" = [ ];
        kwin."Window to Desktop 15" = [ ];
        kwin."Window to Desktop 16" = [ ];
        kwin."Window to Desktop 17" = [ ];
        kwin."Window to Desktop 18" = [ ];
        kwin."Window to Desktop 19" = [ ];
        kwin."Window to Desktop 2" = [ ];
        kwin."Window to Desktop 20" = [ ];
        kwin."Window to Desktop 21" = [ ];
        kwin."Window to Desktop 22" = [ ];
        kwin."Window to Desktop 23" = [ ];
        kwin."Window to Desktop 24" = [ ];
        kwin."Window to Desktop 25" = [ ];
        kwin."Window to Desktop 3" = [ ];
        kwin."Window to Desktop 4" = [ ];
        kwin."Window to Desktop 5" = [ ];
        kwin."Window to Desktop 6" = [ ];
        kwin."Window to Desktop 7" = [ ];
        kwin."Window to Desktop 8" = [ ];
        kwin."Window to Desktop 9" = [ ];
        kwin."Window to Next Desktop" = [ ];
        kwin."Window to Next Screen" = "Meta+Shift+Right";
        kwin."Window to Previous Desktop" = [ ];
        kwin."Window to Previous Screen" = "Meta+Shift+Left";
        kwin."Window to Screen 0" = [ ];
        kwin."Window to Screen 1" = [ ];
        kwin."Window to Screen 2" = [ ];
        kwin."Window to Screen 3" = [ ];
        kwin."Window to Screen 4" = [ ];
        kwin."Window to Screen 5" = [ ];
        kwin."Window to Screen 6" = [ ];
        kwin."Window to Screen 7" = [ ];
        kwin.disableInputCapture = "Meta+Shift+Esc";
        kwin.view_actual_size = "Meta+0";
        kwin.view_zoom_in = ["Meta++" "Meta+="];
        kwin.view_zoom_out = "Meta+-";
        mediacontrol.mediavolumedown = [ ];
        mediacontrol.mediavolumeup = [ ];
        mediacontrol.nextmedia = "Media Next";
        mediacontrol.pausemedia = "Media Pause";
        mediacontrol.playmedia = [ ];
        mediacontrol.playpausemedia = "Media Play";
        mediacontrol.previousmedia = "Media Previous";
        mediacontrol.seekbackwardmedia = "Media Rewind";
        mediacontrol.seekbackwardmedialong = [ ];
        mediacontrol.seekforwardmedia = "Media Fast Forward";
        mediacontrol.seekforwardmedialong = [ ];
        mediacontrol.stopmedia = "Media Stop";
        org_kde_powerdevil."Decrease Keyboard Brightness" = "Keyboard Brightness Down";
        org_kde_powerdevil."Decrease Screen Brightness" = "Monitor Brightness Down";
        org_kde_powerdevil."Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
        org_kde_powerdevil.Hibernate = "Hibernate";
        org_kde_powerdevil."Increase Keyboard Brightness" = "Keyboard Brightness Up";
        org_kde_powerdevil."Increase Screen Brightness" = "Monitor Brightness Up";
        org_kde_powerdevil."Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
        org_kde_powerdevil.PowerDown = "Power Down";
        org_kde_powerdevil.PowerOff = "Power Off";
        org_kde_powerdevil.Sleep = "Sleep";
        org_kde_powerdevil."Toggle Keyboard Backlight" = "Keyboard Light On/Off";
        org_kde_powerdevil."Turn Off Screen" = [ ];
        org_kde_powerdevil.powerProfile = ["Battery" "Meta+B"];
        plasmashell."Slideshow Wallpaper Next Image" = [ ];
        plasmashell."activate application launcher" = ["Meta" "Alt+F1"];
        plasmashell."activate task manager entry 1" = "Meta+1";
        plasmashell."activate task manager entry 10" = [ ];
        plasmashell."activate task manager entry 2" = "Meta+2";
        plasmashell."activate task manager entry 3" = "Meta+3";
        plasmashell."activate task manager entry 4" = "Meta+4";
        plasmashell."activate task manager entry 5" = "Meta+5";
        plasmashell."activate task manager entry 6" = "Meta+6";
        plasmashell."activate task manager entry 7" = "Meta+7";
        plasmashell."activate task manager entry 8" = "Meta+8";
        plasmashell."activate task manager entry 9" = "Meta+9";
        plasmashell."clear history" = [ ];
        plasmashell.clear-history = [ ];
        plasmashell.clipboard_action = "Meta+Ctrl+X";
        plasmashell.cycle-panels = "Meta+Alt+P";
        plasmashell.cycleNextAction = [ ];
        plasmashell.cyclePrevAction = [ ];
        plasmashell.edit_clipboard = [ ];
        plasmashell."manage activities" = "Meta+Q";
        plasmashell."next activity" = "Meta+A";
        plasmashell."previous activity" = "Meta+Shift+A";
        plasmashell.repeat_action = [ ];
        plasmashell."show dashboard" = "Ctrl+F12";
        plasmashell.show-barcode = [ ];
        plasmashell.show-on-mouse-pos = "Meta+V";
        plasmashell."switch to next activity" = [ ];
        plasmashell."switch to previous activity" = [ ];
        plasmashell."toggle do not disturb" = [ ];
      };
      configFile = {
        baloofilerc.General.dbVersion = 2;
        dolphinrc.General.ViewPropsTimestamp = "2026,7,9,0,58,58.835";
        dolphinrc."KFileDialog Settings"."Places Icons Auto-resize" = false;
        dolphinrc."KFileDialog Settings"."Places Icons Static Size" = 22;
        kactivitymanagerdrc.activities."790474b2-8553-4f1d-823a-ca179b01e23d" = "Default";
        kded5rc.Module-device_automounter.autoload = false;
        kdeglobals.KDE.contrast = 4;
        kdeglobals.KDE.frameContrast = 0.2;
        kdeglobals.WM.activeBackground = "39,44,49";
        kdeglobals.WM.activeBlend = "252,252,252";
        kdeglobals.WM.activeForeground = "252,252,252";
        kdeglobals.WM.inactiveBackground = "32,36,40";
        kdeglobals.WM.inactiveBlend = "161,169,177";
        kdeglobals.WM.inactiveForeground = "161,169,177";
        krunnerrc."Runners/krunner_jetbrainsrunner".checkedUpdateDate = "Thu Jul 9 2026";
        kwinrc.Desktops.Id_1 = "420a101d-850e-4ffe-a803-d9626fd2bd52";
        kwinrc.Desktops.Number = 1;
        kwinrc.Desktops.Rows = 1;
        kwinrc."Tiling/420a101d-850e-4ffe-a803-d9626fd2bd52/1224cbd2-a4c5-4902-b5e0-8fa2f749af0d".padding = 4;
        kwinrc."Tiling/420a101d-850e-4ffe-a803-d9626fd2bd52/1224cbd2-a4c5-4902-b5e0-8fa2f749af0d".tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        kwinrc."Tiling/420a101d-850e-4ffe-a803-d9626fd2bd52/ab60c9f3-bfba-4558-8384-dc53c664dccf".padding = 4;
        kwinrc."Tiling/420a101d-850e-4ffe-a803-d9626fd2bd52/ab60c9f3-bfba-4558-8384-dc53c664dccf".tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        kwinrc.Xwayland.Scale = 1.45;
        kwinrulesrc.General.rules = "";
        plasma-localerc.Formats.LANG = "en_US.UTF-8";
        plasmanotifyrc."Applications/firefox".Seen = true;
      };
      dataFile = {
        "kate/anonymous.katesession"."Document 0".URL = "file:///home/hadif/Documents/nixos_new/modules/features/discord.nix";
        "kate/anonymous.katesession"."Document 1".URL = "file:///home/hadif/Documents/nixos_new/modules/hosts/pc/configuration.nix";
        "kate/anonymous.katesession"."Document 2".URL = "file:///home/hadif/Documents/nixos_new/modules/home/home.nix";
        "kate/anonymous.katesession"."Document 3".URL = "file:///home/hadif/Documents/nixos_new/modules/home/plasma.nix";
        "kate/anonymous.katesession"."Document 4".URL = "file:///home/hadif/Documents/nixos_new/modules/preservation.nix";
        "kate/anonymous.katesession"."Document 5".URL = "file:///home/hadif/Documents/nixos_new/output.txt";
        "kate/anonymous.katesession"."Kate Plugins".bookmarksplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".cmaketoolsplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".compilerexplorer = false;
        "kate/anonymous.katesession"."Kate Plugins".eslintplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".externaltoolsplugin = true;
        "kate/anonymous.katesession"."Kate Plugins".formatplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".katebacktracebrowserplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".katebuildplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".katecloseexceptplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".katecolorpickerplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".katectagsplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".katefilebrowserplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".katefiletreeplugin = true;
        "kate/anonymous.katesession"."Kate Plugins".kategdbplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".kategitblameplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".katekonsoleplugin = true;
        "kate/anonymous.katesession"."Kate Plugins".kateprojectplugin = true;
        "kate/anonymous.katesession"."Kate Plugins".katereplicodeplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".katesearchplugin = true;
        "kate/anonymous.katesession"."Kate Plugins".katesnippetsplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".katesqlplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".katesymbolviewerplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".katexmlcheckplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".katexmltoolsplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".keyboardmacrosplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".ktexteditorpreviewplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".latexcompletionplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".lspclientplugin = true;
        "kate/anonymous.katesession"."Kate Plugins".openlinkplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".rainbowparens = false;
        "kate/anonymous.katesession"."Kate Plugins".rbqlplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".tabswitcherplugin = true;
        "kate/anonymous.katesession"."Kate Plugins".templateplugin = false;
        "kate/anonymous.katesession"."Kate Plugins".textfilterplugin = true;
        "kate/anonymous.katesession".MainWindow0."Active ViewSpace" = 0;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-H-Splitter = "200,2402,0";
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-0-Bar-0-TvList = "kate_private_plugin_katefiletreeplugin,kateproject,kateprojectgit,lspclient_symbol_outline";
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-0-LastSize = 200;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-0-SectSizes = 0;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-0-Splitter = 1307;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-1-Bar-0-TvList = "";
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-1-LastSize = 200;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-1-SectSizes = 0;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-1-Splitter = 1307;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-2-Bar-0-TvList = "";
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-2-LastSize = 200;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-2-SectSizes = 0;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-2-Splitter = 2402;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-3-Bar-0-TvList = "output,diagnostics,kate_plugin_katesearch,kateprojectinfo,kate_private_plugin_katekonsoleplugin";
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-3-LastSize = 200;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-3-SectSizes = 0;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-3-Splitter = 2314;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-Style = 2;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-Sidebar-Visible = true;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-diagnostics-Position = 3;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-diagnostics-Show-Button-In-Sidebar = true;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-diagnostics-Visible = false;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kate_plugin_katesearch-Position = 3;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kate_plugin_katesearch-Show-Button-In-Sidebar = true;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kate_plugin_katesearch-Visible = false;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kate_private_plugin_katefiletreeplugin-Position = 0;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kate_private_plugin_katefiletreeplugin-Show-Button-In-Sidebar = true;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kate_private_plugin_katefiletreeplugin-Visible = false;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kate_private_plugin_katekonsoleplugin-Position = 3;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kate_private_plugin_katekonsoleplugin-Show-Button-In-Sidebar = true;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kate_private_plugin_katekonsoleplugin-Visible = false;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kateproject-Position = 0;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kateproject-Show-Button-In-Sidebar = true;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kateproject-Visible = true;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kateprojectgit-Position = 0;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kateprojectgit-Show-Button-In-Sidebar = true;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kateprojectgit-Visible = false;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kateprojectinfo-Position = 3;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kateprojectinfo-Show-Button-In-Sidebar = true;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-kateprojectinfo-Visible = false;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-lspclient_symbol_outline-Position = 0;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-lspclient_symbol_outline-Show-Button-In-Sidebar = true;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-lspclient_symbol_outline-Visible = false;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-output-Position = 3;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-output-Show-Button-In-Sidebar = true;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-ToolView-output-Visible = false;
        "kate/anonymous.katesession".MainWindow0.Kate-MDI-V-Splitter = "0,1307,0";
        "kate/anonymous.katesession"."MainWindow0 Settings".WindowState = 10;
        "kate/anonymous.katesession"."MainWindow0-Splitter 0".Children = "MainWindow0-ViewSpace 0";
        "kate/anonymous.katesession"."MainWindow0-Splitter 0".Orientation = 1;
        "kate/anonymous.katesession"."MainWindow0-Splitter 0".Sizes = 2402;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0"."Active View" = 5;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0".Count = 6;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0".Documents = "0,1,2,3,4,5";
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0"."View 0" = 0;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0"."View 1" = 1;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0"."View 2" = 2;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0"."View 3" = 3;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0"."View 4" = 4;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0"."View 5" = 5;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0 0".CursorColumn = 0;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0 0".CursorLine = 18;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0 3".CursorColumn = 26;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0 3".CursorLine = 4;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0 5".CursorColumn = 43;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0 5".CursorLine = 363;
        "kate/anonymous.katesession"."MainWindow0-ViewSpace 0 5".ScrollLine = 300;
        "kate/anonymous.katesession"."Open Documents".Count = 6;
        "kate/anonymous.katesession"."Open MainWindows".Count = 1;
        "kate/anonymous.katesession"."Plugin:kateprojectplugin:".projects = "";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".BinaryFiles = false;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".CurrentExcludeFilter = "-1";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".CurrentFilter = "-1";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".ExcludeFilters = "";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".ExpandSearchResults = false;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".Filters = "";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".FollowSymLink = false;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".HiddenFiles = false;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".MatchCase = false;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".Place = 1;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".Recursive = true;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".Replaces = "";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".Search = "";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".SearchAsYouTypeAllProjects = true;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".SearchAsYouTypeCurrentFile = true;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".SearchAsYouTypeFolder = true;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".SearchAsYouTypeOpenFiles = true;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".SearchAsYouTypeProject = true;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".SearchDiskFiles = "";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".SearchDiskFiless = "";
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".SizeLimit = 128;
        "kate/anonymous.katesession"."Plugin:katesearchplugin:MainWindow:0".UseRegExp = false;
      };
    };
    programs.kate = {
      enable = true;
      editor = {
        tabWidth = 2;
        indent.showLines = true;
        indent.autodetect = true;
        indent.keepExtraSpaces = false;
        indent.replaceWithSpaces = true;
      };
    };
    programs.okular = {
      enable = true;
      general = {
        smoothScrolling = true;
        showScrollbars = true;
        openFileInTabs = true;
        viewMode = "Single";
        obeyDrm = false;
      };
      performance = {
        enableTransparencyEffects = true;
        memoryUsage = "Aggressive";
      };
    };
  };
}
