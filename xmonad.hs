
-- Imports.
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.SpawnOnce
import XMonad.Config.Kde
import XMonad.Hooks.ManageDocks
import XMonad.Layout.MouseResizableTile
import XMonad.Layout.ResizableTile
import qualified Data.Map as M
-- The main function.
main = xmonad kdeConfig {
    terminal    = "alacritty"
,   modMask     = mod4Mask
,   startupHook = docksStartupHook <+> myStartupHook
,   keys        = \c -> mykeys c `M.union` keys defaultConfig c
,   layoutHook  = avoidStruts (tall ||| Mirror tall ||| Full ||| mouseResizableTile)
,   manageHook  = manageDocks <+> myManageHook <+> manageHook kdeConfig
,   handleEventHook = docksEventHook <+> handleEventHook kdeConfig
}
  where
    tall = ResizableTall 3 (1/10) 1 []

myStartupHook = do
    spawnOnce "plasmashell"
    spawnOnce "picom --experimental-backends"
    spawnOnce "emacs --daemon"
    spawnOnce "xsetroot -cursor_name left_ptr"

myManageHook = composeAll
  [ className =? "yakuake" --> doFloat
  , className =? "Yakuake" --> doFloat
  , className =? "Kmix" --> doFloat
  , className =? "kmix" --> doFloat
  , className =? "plasma" --> doFloat
  , className =? "Plasma" --> doFloat
  , className =? "plasma-desktop" --> doFloat
  , className =? "Plasma-desktop" --> doFloat
  , className =? "krunner" --> doFloat
  , className =? "ksplashsimple" --> doFloat
  , className =? "ksplashqml" --> doFloat
  , className =? "ksplashx" --> doFloat
  , className =? "plasmashell"  --> doFloat
  -- , className =? "zoom" --> doFloat
  ]

mykeys (XConfig {modMask = modm}) = M.fromList $
     [ ((modm , xK_p), spawn "rofi -combi-modi window,drun,ssh -show combi -modi combi -dpi 192 -font \"Cascadia Code 12\"")
     , ((modm , xK_x), spawn "rofi -show run -dpi 192 -font \"Cascadia Code 12\" -run-command \"/usr/bin/zsh -c {cmd}\"")
     , ((modm , xK_Up), sendMessage MirrorExpand)
     , ((modm , xK_Down), sendMessage MirrorShrink)
     , ((modm , xK_Right), sendMessage Expand)
     , ((modm , xK_Left), sendMessage Shrink)
     , ((modm , xK_m), sendMessage MirrorExpand)
     , ((modm , xK_n), sendMessage MirrorShrink)
     , ((modm , xK_u), sendMessage ShrinkSlave)
     , ((modm , xK_i), sendMessage ExpandSlave)
     , ((modm , xK_l), sendMessage Expand)
     , ((modm , xK_h), sendMessage Shrink)
     ]
