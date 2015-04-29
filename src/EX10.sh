############# SCC2015 #############
#############  OSSEC  #############
##### Baroudi Safwene - Team 3 #####

#EX - 10 - 6pts - Ecrire un script qui prend en paramètre un nom et l'url d'une playlist youtube, télécharge tous les morceaux de cette dernière au format mp3, puis compresse le tout dans un fichier .tar.gz dont le nom est celui entré en paramètre.#

#!/bin/bash

read -p "Enter the url of the playlist : " plist

if youtube-dl --yes-playlist --extract-audio --audio-format mp3 $plist
then
    tar czvf playList.tar.gz *.mp3
else
    exit
fi
