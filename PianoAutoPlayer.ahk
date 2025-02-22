#SingleInstance Force
SetBatchLines, -1
global paused := false, lastSong := "", currentPos := 0, totalLength := 0, isPlaying := false, PianoMusic := "", KeyDelay := 100

Gui, Color, 242424
Gui, Font, s10, Segoe UI

Gui, Add, GroupBox, x10 y10 w460 h95 cWhite, 🎵 Piano Controls
Gui, Add, Text, x20 y33 w100 h20 cWhite, Key Delay :
Gui, Add, Text, x90 y33 w80 vKeyDelay cWhite, 100
Gui, Add, Button, x360 y30 w100 h25 gOpenFile, 📂 Open File
Gui, Add, Text, x20 y55 w100 h20 cWhite, Now Playing :
Gui, Add, Text, x105 y55 w300 h20 vNowPlaying cWhite, No File Loaded
Gui, Add, Progress, x20 y80 w440 h15 vVisualizer c242424, 0

Gui, Add, GroupBox, x10 y115 w460 h145 cWhite, 🎼 Piano Music
Gui, Add, Edit, x20 y140 w440 h110 vPianoMusic ReadOnly cWhite

Gui, Show,, Piano Player

OpenFile:
FileSelectFile, filePath, 3, , Select a text file, Text Documents (*.txt)
if !filePath
    return

FileRead, fileContent, %filePath%
if ErrorLevel
    return

SplitPath, filePath, fileName
StringReplace, fileName, fileName, .txt,, All
GuiControl,, NowPlaying, %fileName%

PianoMusic := ""
KeyDelay := 100
totalLength := 0
currentPos := 0
isPlaying := false
GuiControl,, KeyDelay, %KeyDelay%
GuiControl,, PianoMusic, %PianoMusic%
GuiControl,, Visualizer, 0

lines := StrSplit(fileContent, "`n", "`r")
if (lines.Length() > 0) {
    KeyDelay := Trim(lines[1])
    PianoMusic := Trim(StrReplace(fileContent, lines[1] . "`r`n"))
    totalLength := StrLen(PianoMusic)
    GuiControl,, KeyDelay, %KeyDelay%
    GuiControl,, PianoMusic, %PianoMusic%
    GuiControl,, Visualizer, 0
    currentPos := 0
    X := 1
}
return

F4:: 
!F4:: 
if (!isPlaying) {
    Gui, Submit, Nohide
    PianoMusic := RegExReplace(PianoMusic, "`n|`r|/")
    StringReplace, PianoMusic, PianoMusic, %A_Space%,, All
    currentPos := 1
    X := 1
    isPlaying := true
}

X := currentPos
while (X := RegExMatch(PianoMusic, "U)(\[.*]|.)", Keys, X)) {
    Gui, Submit, Nohide
    PianoMusic := RegExReplace(PianoMusic, "`n|`r|/")
    StringReplace, PianoMusic, PianoMusic, %A_Space%,, All
    X += StrLen(Keys)
    Keys := Trim(Keys, "[]")

    if (Keys != " ") {
        Send, % Keys
    }
    
    currentPos := X
    VisualizerPos := (currentPos / totalLength) * 100

    if (VisualizerPos > 100) {
        VisualizerPos := 100
    }

    if (X < totalLength) {
        Sleep, %KeyDelay%
    } else {
        isPlaying := false
        break
    }

    GuiControl,, Visualizer, %VisualizerPos%
}
return

f8:: 
Pause
Suspend
return

GuiClose:
ExitApp