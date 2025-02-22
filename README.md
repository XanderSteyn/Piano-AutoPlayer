# 🎹 Piano Autoplayer

An autoplayer that can play piano music based on a provided text file. It allows you to control the playback of music, including pausing and resuming the song. The song's tempo is controlled by the key delay (usually double the BPM of the song)

## 🚀 Features

- **Key Delay** : The delay between each note, set by the first line of the text file (typically double the BPM of the song)
- **File Loading** : You can load a song through a simple text file.
- **Song Playback** : The autoplayer will automatically play the notes listed in the text file.
- **Pause/Resume** : Use F8 to pause and resume the song.
- **Play/Pause Function** : F4 allows you to start or resume playing when the song is not finished.
- **Visualizer** : Displays the progress of the song with a visual bar.

---

## 🛠 Installation

1. Download the script file.
2. Make sure you have AutoHotkey installed on your system.
3. Save your songs as `.txt` files, where :
   - The first line contains the key delay (usually double the BPM)
   - From line 2 onwards, the notes are listed.
4. Run the script by double-clicking on the `.ahk` file.

---

## 🎮 Usage

1. **Open a Song File** : Click on the **📂 Open File** button and select a `.txt` song file.
2. **Start Playback** : Press **F4** to start playing the song. If the song has not finished, pressing **F8** will resume playback.
3. **Pause and Resume** : Press **F8** to pause and resume playback.

---

## 🛑 How It Works

1. **Key Delay** : The script reads the key delay from the first line of the text file. The delay is set to control the speed at which notes are played.
2. **Song Notes** : The script reads the notes from the second line onward. Each note is then sent as a key press with the defined delay between them.
3. **Visualizer** : A progress bar shows the current position of the song, which is updated as the song plays.
4. **Playback Control** : Press **F4** to start playback. Press **F8** to pause or resume the playback.

---

## 📂 Example Song Files

Feel free to use the provided song text files, or create your own! The files should be structured like this :

```
200
[8yuo] w t u t w 8 w t u t w
[8s] w [th] u t [ws]
[0a] r [yh] o y [rh]
[qj] t [ih] p [ig] t
[0h] t o t [oj] [tk]
```

Where the first line is the key delay (200 in this case) and the following lines are the notes.

---

## ⚠️ Notes

- The key delay is important for the correct tempo of the song.
- The text file should only contain the notes and the delay, formatted properly.
- If the song is paused, press **F8** to resume playback.

---
