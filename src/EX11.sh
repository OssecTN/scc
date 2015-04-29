############# SCC2015 #############
#############  OSSEC  #############
##### Baroudi Safwene - Team 3 #####

#EX - 11 - 5pts - Écrire un script shell qui permet d'afficher la différence entre deux fichiers et la supprimer pour donner deux fichiers identiques.#


existe=1
touch output
touch temp
if [ -f $1 -a -f $2 -a $# -eq 2 ]
then


    diff $1 $2 > temp
    taille=`ls -l temp | tr -s " " | cut -d" " -f5`
    if [ $taille -eq 0 ]
    then
        echo "Identiques" 
    else
        echo la difference est 
        cat temp 
    fi
    echo "" > output

    ii=0
    jj=0

    while read i
    do
        ii=`expr $ii + 1`
        jj=0
        while read j
        do
            jj=`expr $jj + 1`
            if [ $jj -eq $ii ]
            then
                if [ "$j" = "$i" ]
                then
                    echo $j >> output 
                fi
                break
            fi

        done < $2
    done < $1
    cat output > $1
    cat output > $2
    rm output
    rm temp

else
    echo "Eror" 
fi
