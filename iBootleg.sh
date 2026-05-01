#!/bin/bash

#establishes temporary file location
mkdir -p /tmp/iBootleg
#cds into that directory for yt-dlp
cd /tmp/iBootleg/



declare -A acronyms

# This logic determines if the video is a playlist or a chaptered video
album=$(yt-dlp --skip-download -I 1 --print playlist_title $1)
if echo $album | grep -q NA; then

    #This uses a single video with chapters

    #Changes album name to the name of the video, as there is no playlist title
    album=$(yt-dlp --skip-download --print title $1)

    #Download the Files
    yt-dlp -t mp3 -o "NA" --embed-thumbnail --split-chapters -o "chapter:%(section_number)s@%(section_title)S.%(ext)s" $1

    #Establishes index, in case the video is a single
    index=0

    #Iterate over playlist items
    IFS=$'\n'; for l in $(ls);
    do

        #Set the index and title variable to the title and index of the video
        IFS=$'@' read index title <<<$(echo $l);

        #Set the metadata of the file so they are imported as an album
        mid3v2 "$l" -T "$index"
        mid3v2 "$l" -A "$album"

        #Rename the file to remove the index
        mv $l $title

    done

    #Remove the temporary NA file
    rm 'NA.mp3'

else
    #This command uses playlists

    #Download The files
    yt-dlp -t mp3 --embed-thumbnail -o "%(playlist_index)s@%(title)S.%(ext)s" $1

    #Iterate over playlist items
    IFS=$'\n'; for l in $(ls);
    do
        #Set the index and title variable to the title and index of the video
        IFS=$'@' read index title <<<$(echo $l);

        #Set the metadata of the file so they are imported as an album
        mid3v2 "$l" -T "$index"
        mid3v2 "$l" -A "$album"

        #Rename the file to remove the index
        mv $l $title

    done

fi

#Move files to the iTunes library
mv '/tmp/iBootleg/' '~/Music/iTunes/iTunes Media/Automatically Add to iTunes/temp'





