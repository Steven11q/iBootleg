iBootleg is a bash script to automate the uploading of youtube videos to iTunes. For a long time i've made extensive use of an obscure feature of apple music to upload mp3 files as custom albums to my library. This was really annoying, so I wrote a script to automate the process.

This is made possible by the "Automatically Add to iTunes" folder. Files added to that library are automatically uploaded.

This project uses [yt-dlp](https://github.com/yt-dlp/yt-dlp) and [mid3v2](https://github.com/mutagen-io/mutagen)

This script can use playlists, as well as chaptered videos. Chaptered videos are split up by chapter, and uploaded as an album. Playlists are split by video.


How to use:

Make sure you have iTunes running under wine.

git clone https://github.com/Steven11q/iBootleg.git
cd iBootleg
chmod +x iBootleg.sh
iBootleg.sh 'https://www.youtube.com/watch?v=84YxwrxRc5s&t=100s'

It should automatically upload the playlist as an album to your apple music library.
