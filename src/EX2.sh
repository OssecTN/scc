############# SCC2015 #############
#############  OSSEC  #############
##### Baroudi Safwene - Team 3 #####

#EX - 2 - 8pts - Ecrire un script shell qui vous permet de récupérer toutes les images d'une page web et les mettres dans un dossier nommé : www.pageweb.com.#

#!/bin/bash

if [ $# -ne 1 ]
then
    echo "invalid number of arguments!" 1>&2
    exit 1
fi

if  ping -c 1 $1 &> /dev/null
then
    wget --directory-prefix=www.pageweb.com --no-directories --recursive --accept jpg,gif,png,jpeg http://$1
    rm www\.pageweb\.com/*.html www\.pageweb\.com/*.txt &> /dev/null
else
    echo "network problem or invalid web address" 1>&2
    echo "example.com"1>&2
    exit
fi

