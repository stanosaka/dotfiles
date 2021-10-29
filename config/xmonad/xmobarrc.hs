Config {
         font = "xft:FantasqueSansMono Nerd Font:size=10:bold:antialias=true"
       , additionalFonts = [ "xft:FantasqueSansMono Nerd Font:size=9:bold:antialias=true" ]
       -- , additionalFonts = [ "xft:FontAwesome 5 Free:size=13", "xft:Material Design Icons:size=13"  ]
       , allDesktops = True
       , bgColor = "#282c34"
       , fgColor = "#bbc2cf"
       , position = TopW L 100
       , border = FullB
       , borderColor = "#282c34"
       , borderWidth = 2
       , textOffset = 24
       , textOffsets = [23]
       , commands = [ Run StdinReader

                    , Run Alsa "default" "Master"
                          [ "-t", "<fc=#98971a><status> <volume>%</fc>"
                          , "-H", "60"
                          , "--"
                          , "--on", ""
                          , "--off", "婢 "
                          , "--onc", "#98971a"
                          , "--offc", "#7c6f64"
                          , "--lows", "奄 "
                          , "--mediums", "奔 "
                          , "--highs", "墳 " ]

--                     , Run CoreTemp
--                           [ "-t", "<fc=#98971a><fn=1></fn></fc> <core0>°"
--                           , "-L", "30"
--                           , "-H", "75"
--                           , "-l", "lightblue"
--                           , "-n", "#bbc2cf"
--                           , "-h", "#cc241d" ]
--                           50

                    , Run Cpu
                          -- [ "--template", "<fc=#cc241d><fn=1></fn> <total>%</fc>" ]
                          [ "--template", "<fc=#cc241d><fn=1> </fn> <total>%</fc>" ]
                          -- , "--Low","3"
                          -- , "--High","50"
                          -- , "--low","#bbc2cf"
                          -- , "--normal","#bbc2cf"
                          -- , "--high","#cc241d" ]
                          50

                    , Run Memory
                          ["-t","<fc=#d79921><fn=1> </fn> <usedratio>%</fc>" ]
                          -- ,"-H","80"
                          -- ,"-L","10"
                          -- ,"-l","#bbc2cf"
                          -- ,"-n","#bbc2cf"
                          -- ,"-h","#cc241d" ]
                          50

                    , Run DiskU
                          [("/", "<fc=#458588><fn=1> </fn> <free></fc>")] []
                          -- [ "-L", "5"
                          -- , "-m", "1"
                          -- , "-p", "3"
                          -- , "--normal", "#bbc2cf"
                          -- , "--low", "#cc241d" ]
                          20

                    , Run Date "%a %b %_d %I:%M" "date" 300

                    , Run Kbd [("us", "US"), ("ru", "RU")]

                    , Run Com "/home/kotokrad/.config/xmonad/padding-icon.sh" ["panel"] "trayerpad" 10

                    , Run BatteryP       [ "BAT0" ]
                                         [ "--template" , "<fc=#427b58><fn=1>  </fn></fc> <acstatus>"
                                         , "--Low"      , "10"        -- units: %
                                         , "--High"     , "80"        -- units: %
                                         , "--low"      , "#cc241d"
                                         , "--normal"   , "#3c3836"
                                         , "--high"     , "#3c3836"

                                         , "--" -- battery specific options
                                                   -- discharging status
                                                   , "-o"        , "<left>% (<timeleft>)"
                                                   -- AC "on" status
                                                   , "-O"        , "<left>%" -- 50fa7b
                                                   -- charged status
                                                   , "-i"        , "<left>%"
                                                   -- , "-lows"     , "  <left> (<timeleft>)"
                                                   -- , "-mediums"  , "  <left> (<timeleft>)"
                                                   -- , "-highs"    , "  ZZ <left> (<timeleft>)"
                                                   -- , "--off-icon-pattern", "<acstatus>"
                                         ] 50

                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ %alsa:default:Master%  %cpu%  %memory%  %disku%  %battery% <fc=#7c6f64></fc> %kbd% <fc=#7c6f64></fc> %date% %trayerpad%"
       }
