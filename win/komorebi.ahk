#SingleInstance Force

; You can generate a fresh version of this file with "komorebic ahk-library"
#Include %A_ScriptDir%\komorebic.lib.ahk
; https://github.com/LGUG2Z/komorebi/#generating-common-application-specific-configurations
#Include %A_ScriptDir%\komorebi.generated.ahk

WM_DISPLAYCHANGE := 0x7E
OnMessage(WM_DISPLAYCHANGE, "handle_display_change")

handle_display_change(wParam, lParam)
{
    ; MsgBox "hello displaychange"
    RunWait, komorebic.exe stop, , Hide
    RunWait, komorebic.exe start, , Hide
    Retile()
}

; Default to minimizing windows when switching workspaces
WindowHidingBehaviour("minimize")

; Set cross-monitor move behaviour to insert instead of swap
CrossMonitorMoveBehaviour("insert")

; Enable hot reloading of changes to this file
WatchConfiguration("enable")

; Ensure there is 1 workspace created on monitor 0
EnsureWorkspaces(0, 1)

; Configure the invisible border dimensions
InvisibleBorders(7, 0, 14, 7)

; Configure the 1st workspace
WorkspaceName(0, 0, "I")

; laptop monitor
WorkspacePadding(0, 0, 3)
ContainerPadding(0, 0, 5)

; Portrait monitor
WorkspaceLayout(2, 0, "rows")
WorkspacePadding(2, 0, 3)
ContainerPadding(2, 0, 5)

; Upper monitor
WorkspacePadding(3, 0, 3)
ContainerPadding(3, 0, 5)

; Lower monitor
WorkspacePadding(1, 0, 3)
ContainerPadding(1, 0, 5)

; Uncomment the next two lines if you want a visual border drawn around the focused window
ActiveWindowBorderColour(68, 71, 90, "single") ; Dracula "selection" color
; ActiveWindowBorderColour(189, 147, 249, "single") ; Dracula purple
ActiveWindowBorder("enable")

; Focus follows mouse
FocusFollowsMouse("enable", "windows")
MouseFollowsFocus("enable")

; Signal has overflowing borders
Run, komorebic.exe identify-border-overflow-application exe "Signal.exe", , Hide

; Allow komorebi to start managing windows
CompleteConfiguration()

; For Brand New Model F62 "Kishsaver" with HHKB-style split right shift key.
; The key between righthand Alt and Ctrl gets sent by the default firmware as
; NumLock... change that to righthand Windows key.
NumLock::
Send, {RWin}
return

; ctrl-shift-meta-L: open windows terminal with komorebi log
^#+l::
Run, wt komorebic log
return

; Maximize/minimize focused window
#t::
Retile()
return

; Maximize/minimize focused window
#b::
ActiveWindowBorder("enable")
return

; Maximize/minimize focused window
#s::
ToggleFocusFollowsMouse("windows")
return

; Maximize/minimize focused window
#m::
ToggleMonocle()
return

; Float focused window
#f::
ToggleFloat()
return

; Change the focused window, Win + Vim direction keys (HJKL)
#h::
Focus("left")
return

#j::
Focus("down")
return

#k::
Focus("up")
return

#l::
Focus("right")
return

; Move the focused window in a given direction, Alt + Shift + Vim direction keys (HJKL)
#+h::
Move("left")
return

#+j::
Move("down")
return

#+k::
Move("up")
return

#+l::
Move("right")
return

; Application shortcuts
#Enter::
Run, "C:\Program Files\Mozilla Firefox\firefox.exe"
return

#+Enter::
Run, "C:\Program Files\Alacritty\alacritty.exe"
return

; There are many more commands that you can bind to whatever keys combinations you want!
;
; Have a look at the komorebic.lib.ahk file to see which arguments are required by different commands
;
; If you want more information about a command, you can run every komorebic command with "--help"
;
; For example, if you see this in komorebic.lib.ahk
;
; WorkspaceLayout(monitor, workspace, value) {
;    Run, komorebic.exe workspace-layout %monitor% %workspace% %value%, , Hide
; }
;
; Just run "komorebic.exe workspace-layout --help" and you'll get all the information you need to use the command
;
; komorebic.exe-workspace-layout
; Set the layout for the specified workspace
;
; USAGE:
;    komorebic.exe workspace-layout <MONITOR> <WORKSPACE> <VALUE>
;
; ARGS:
;    <MONITOR>      Monitor index (zero-indexed)
;    <WORKSPACE>    Workspace index on the specified monitor (zero-indexed)
;    <VALUE>        [possible values: bsp, columns, rows, vertical-stack, horizontal-stack, ultrawide-vertical-stack]
;
; OPTIONS:
;    -h, --help    Print help information
