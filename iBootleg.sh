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
    #echo $album

    #Download the Files
    yt-dlp -t mp3 -o "NA" --embed-thumbnail --split-chapters -o "chapter:%(section_number)s@%(section_title)S.%(ext)s" $1

    #Establishes index, in case the video is a single
    index=0

    #Prepare Metadata
    IFS=$'\n'; for l in $(ls);
    do

        #echo "l: $l"

        IFS=$'@' read index title <<<$(echo $l);



        #echo "$title"

        #echo "1 Index_title: $l"
        mid3v2 "$l" -T "$index"
        mid3v2 "$l" -A "$album"

        mv $l $title



    done

    rm 'NA.mp3'



    #my_array[1]="new_value"

else
    #This command uses playlists

    echo "album: $album"


    #Download The files
    yt-dlp -t mp3 --embed-thumbnail -o "%(playlist_index)s@%(title)S.%(ext)s" $1



    #prepare Metadata
    IFS=$'\n'; for l in $(ls);
    do
        IFS=$'@' read index title <<<$(echo $l);

        #echo index: $index
        #echo title: $title



        echo "$l";

        mid3v2 "$l" -T "$index"
        mid3v2 "$l" -A "$album"
        mv $l $title


    done




fi


mv '/tmp/iBootleg/' '/home/$USER/Music/iTunes/iTunes Media/Automatically Add to iTunes/temp'





