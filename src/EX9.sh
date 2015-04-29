############# SCC2015 #############
#############  OSSEC  #############
##### Baroudi Safwene - Team 3 #####

#EX - 9 - 7pts - Prévoir un système de réveil ou de rappel qui signale au moment voulu le titre de l'alerte ainsi qu'un signal sonore (qui tourne en boucle, et qui ne se termine que dans l'une des conditions suivantes: touche "e" ou écoulement de 10minutes.#

#!/bin/bash

read -p "Enter the title : " title
read -p "Enter hour : " hour
read -p "Enter minute : " minute
read -p "Enter the day : " day
read -p "Enter the month : " month
read -p "Enter the path of the music to be displayed : " music

if [ ! -f $music ]
then
    echo "$music is not a valid file." 1>&2
    exit 
fi

until [ $h = $hour ] && [ $m = $minute ] && [ $day = $d ] && [ $mon = $month ]
do
    h=$(date +%H | sed 's/^0//')
    m=$(date +%M | sed 's/^0//')
    d=$(date +%D|cut -d"/" -f2 | sed 's/^0//')
    mon=$(date +%D | cut -d"/" -f1 | sed 's/^0//')
done
DISPLAY=:0
vlc $music &> /dev/null &
if [ $($minute + 10) -le 59 ]
then
    max=$( $minute + 10 )
else
    max=$(10 - (60 - $minute ))
fi
until x=$(date +%M | sed 's/^0//');
    [ $val = "e" ] || [ $x -ge $max ] 
do
    dialog --title "$title" --inputbox "Enter e to stop :" 9 40  2> answer 
    val=`cat answer`
done

ps -ely | grep vlc | xargs kill &> /dev/null
