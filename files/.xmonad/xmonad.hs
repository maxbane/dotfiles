import XMonad
import XMonad.Util.EZConfig

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops

import XMonad.Layout.NoBorders
import XMonad.Layout.Circle
import XMonad.Layout.Grid
import XMonad.Layout.ResizableTile
import XMonad.Layout.ThreeColumns
-- import XMonad.Layout.Fullscreen

-- See https://github.com/davidbrewer/xmonad-ubuntu-conf

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

{-
  Xmobar configuration variables. These settings control the appearance
  of text which xmonad is sending to xmobar via the DynamicLog hook.
-}

myTitleColor     = "#eeeeee"  -- color of window title
myTitleLength    = 80         -- truncate window title to this length
myCurrentWSColor = "#e6744c"  -- color of active workspace
myVisibleWSColor = "#c185a7"  -- color of inactive workspace
myUrgentWSColor  = "#cc0000"  -- color of workspace with 'urgent' window
myCurrentWSLeft  = "["        -- wrap active workspace with these
myCurrentWSRight = "]"
myVisibleWSLeft  = "("        -- wrap inactive workspace with these
myVisibleWSRight = ")"
myUrgentWSLeft  = "{"         -- wrap urgent workspace with these
myUrgentWSRight = "}"


-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP {
    -- ppCurrent = xmobarColor "#429942" "" . wrap "<" ">"
    ppTitle = xmobarColor myTitleColor "" . shorten myTitleLength
    , ppCurrent = xmobarColor myCurrentWSColor ""
        . wrap myCurrentWSLeft myCurrentWSRight
    , ppVisible = xmobarColor myVisibleWSColor ""
        . wrap myVisibleWSLeft myVisibleWSRight
    , ppUrgent = xmobarColor myUrgentWSColor ""
        . wrap myUrgentWSLeft myUrgentWSRight
}

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)


-- Main configuration, override the defaults to your liking.
myConfig = defaultConfig {
    modMask = mod4Mask,
	--terminal = "xterm -bg black -fg gray -fa \"Ubuntu Mono\" -fs 12 -e '/usr/bin/env -u TMUX tmux -2'",
	terminal = "gnome-terminal -e '/usr/bin/env -u TMUX tmux -2'",
	handleEventHook = fullscreenEventHook,
    -- border colors from solarized dark palette
    focusedBorderColor = "#268bd2",
    normalBorderColor = "#586e75",
	layoutHook = smartBorders(avoidStruts(
        ResizableTall 1 (3/100) (1/2) []
        ||| Mirror (ResizableTall 1 (3/100) (1/2) [])
        ||| noBorders Full
        ||| Grid
        ||| ThreeColMid 1 (3/100) (3/4)
        ||| Circle
    ))

	-- manageHook = composeAll [
	--     className =? "Gimp" --> doFloat,
	--     className =? "MPlayer" --> doFloat,
	--     isFullscreen --> doFullFloat
	-- ]
    }
    `additionalKeys`
    [
	((mod4Mask .|. shiftMask, xK_l), spawn "slock")
	, ((mod4Mask, xK_minus),
            spawn "pactl set-sink-volume bluez_sink.FC_58_FA_01_4F_BD -- -5%")
	, ((mod4Mask, xK_equal),
            spawn "pactl set-sink-volume bluez_sink.FC_58_FA_01_4F_BD -- +5%")
	, ((mod4Mask, xK_0),
            spawn "pactl set-sink-volume bluez_sink.FC_58_FA_01_4F_BD -- 0%")
    ]
