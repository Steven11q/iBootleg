iBootleg is a bash script to automate the uploading of youtube videos to iTunes. For a long time i've made extensive use of an obscure feature of apple music to upload mp3 files as custom albums to my library. This was really annoying, so I wrote a script to automate the process.

This is made possible by the "Automatically Add to iTunes" folder. Files added to that library are automatically uploaded.

This project uses [yt-dlp](https://github.com/yt-dlp/yt-dlp) and [mid3v2](https://github.com/mutagen-io/mutagen)

This script can use playlists, as well as chaptered videos.
The main caveat being: the video needs pre-existing chapters for this process to work. 


How to use:

Make sure you have iTunes running under wine.

```
git clone https://github.com/Steven11q/iBootleg.git
cd iBootleg
chmod +x iBootleg.sh
iBootleg.sh 'https://www.youtube.com/watch?v=84YxwrxRc5s&t=100s'
```
Sometimes youtube videos don't have chapters, but they do have a pinned comment with timestamps.
To use a timestamp file, you must create a text file formatted exactly like this:
```
1-Enchanted Mirror-0:00
2-Summertime Love-4:00
3-Reflections-7:00
4-Concerto For Guitar-9:42
5 -Rain-12:58
6-Leque-15:38
7-Missal (Estudio)-17:28
8-Adventure In Space-21:14
```
Index, title, and timestamp seperated by a colon.

You then add this file as a secondary argument to the script


It should automatically upload the playlist as an album to your apple music library.
