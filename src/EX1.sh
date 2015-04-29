############# SCC2015 #############
#############  OSSEC  #############
##### Baroudi Safwene - Team 3 #####

#EX - 1 - 7pts - Ecrire un Script qui prend en paramètre le chemin d’un dossier (exp : /home/scc/ ) et organise les fichiers qu'il contient dans 4 dossiers : /home/scc/images/, /home/scc/docs, /home/scc/music, /home/scc/videos.

    #Images : jpeg – png – bmp – gif
    #videos : mpeg – avi – mp4
    #music : mp3
    #docs : txt – pdf – odt

#Ce dernier doit aussi afficher la liste des fichiers qu'il n'a pas pus les classés
#exp : - fich.zip - fich.flv#


#!/bin/bash

if [ $# -ne 1 ]
then
    echo "invalid number of arguments" 2>&1
    exit 1
fi

if [ ! -d $1 ]
then
    echo "$1 is not a directory!" 2>&1
    exit 127
fi
if [ ! -d $1/images ]
then
    mkdir $1/images
fi
if [ ! -d $1/music ]
then
    mkdir $1/music
fi
if [ ! -d $1/videos ]
then
    mkdir $1/videos
fi
if [ ! -d $1/docs ]
then
    mkdir $1/docs
fi
mv $1/*jpg  $1/*png $1/*bmp $1/*gif $1/images &> /dev/null
mv $1/*mpeg $1/*avi $1/*mp4 $1/videos &> /dev/null
mv $1/*mp3 $1/music &> /dev/null
mv $1/*txt $1/*pdf $1/*odt $1/docs &> /dev/null

for entry in $1/*
do
    if [ -f $entry ]
    then
        echo "$entry    n'a pas été classifié!"
    fi
done
