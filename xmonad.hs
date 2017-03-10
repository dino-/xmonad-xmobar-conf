--------------------------------------------------------------------------------
import System.Exit
import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Prompt
import XMonad.Prompt.ConfirmPrompt
import XMonad.Prompt.Shell
import XMonad.Util.EZConfig

-- Added by Dino
import XMonad.Hooks.ManageDocks
import XMonad.Layout.MultiColumns
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns

--------------------------------------------------------------------------------
main = do
  spawn "xmobar" -- Start a task bar such as xmobar.

  -- Start xmonad using the main desktop configuration with a few
  -- simple overrides:
  xmonad $ desktopConfig
    { modMask    = mod4Mask -- Use the "Win" key for the mod key
    , manageHook = myManageHook <+> manageHook desktopConfig
    , logHook    = dynamicLogString def >>= xmonadPropLog
    -- Added by Dino
    , terminal   = "urxvt"
    , focusedBorderColor = "#00ff00"  -- green
    , layoutHook = myLayout
    }

    `additionalKeysP` -- Add some extra key bindings:
      [ ("M-S-q", confirmPrompt myXPConfig "exit" (io exitSuccess))
      , ("M-p",   shellPrompt myXPConfig)
      -- Added by Dino
      , ("M-S-l", spawn "xscreensaver-command -lock")
      ]

--------------------------------------------------------------------------------
-- | Customize layouts
myLayout = avoidStruts $
   tiled |||
   Mirror tiled |||
   Full |||
   multiCol [1] 1 0.01 (-0.5) |||  -- Many equal columns!
   ThreeCol nmaster delta (1/3) |||  -- Three equal columns with resizing
   ThreeColMid nmaster delta ratio |||
   simpleTabbed
   where
      -- default tiling algorithm partitions the screen into two panes
      tiled   = Tall nmaster delta ratio

      -- The default number of windows in the master pane
      nmaster = 1

      -- Default proportion of screen occupied by master pane
      ratio   = 1/2

      -- Percent of screen to increment by when resizing panes
      delta   = 3/100

--------------------------------------------------------------------------------
-- | Customize the way 'XMonad.Prompt' looks and behaves.  It's a
-- great replacement for dzen.
myXPConfig = def
  { position          = Top
  , alwaysHighlight   = True
  , promptBorderWidth = 0
  , font              = "xft:monospace:size=9"
  }

--------------------------------------------------------------------------------
-- | Manipulate windows as they are created.  The list given to
-- @composeOne@ is processed from top to bottom.  The first matching
-- rule wins.
--
-- Use the `xprop' tool to get the info you need for these matches.
-- For className, use the second value that xprop gives you.
myManageHook = composeOne
  [ className =? "Pidgin" -?> doFloat
  , className =? "XCalc"  -?> doFloat
  , className =? "mpv"    -?> doFloat
  , isDialog              -?> doCenterFloat

    -- Move transient windows to their parent:
  , transience
  ]
