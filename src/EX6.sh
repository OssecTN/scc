############# SCC2015 #############
#############  OSSEC  #############
##### Baroudi Safwene - Team 3 #####

#EX - 6 - 7pts - Ecrire un script shell qui permet d'afficher chaque 1min le nombre de j'aime d'une page facebook donnée en paramètre.#


read -p "Enter your facebook page : " page
while ls &> /dev/null
do
    wget -O likes http://graph.facebook.com/$page?fields=likes &> /dev/null

    n=$(grep likes likes | cut -d":" -f2| cut -d"," -f1)

    echo "you have $n fans!"

    sleep 1m
done
