############# SCC2015 #############
#############  OSSEC  #############
##### Hamza - Team 10 #####

#EX - 3 - 5pts - Ecrire un script shell qui à partir de n fichiers txt vous affiche le fichier qui traite le plus un thème donnée en paramètre. Le nombre d’apparition du mot qui définie le thème dans le fichier est le critère qui décide le meilleur fichier.#


#!/bin/bash
if [ $# -eq 2 ]
	then
if [ -d $2 ]
h=0  
		then
		for x in `ls $2`
		do
		if [ -f "$2/$x" ]
		then	
						
			c=0	
			for i in `grep $1 $2/$x `
				do 
			if [ $i == $1 ]
				then 
			c=`expr $c + 1`
			fi
			done
		if [ $c -gt $h ]
			then
		f=$x
		h=$c
			fi		
		fi		
		done
	fi
echo "le fichier est : $f"
echo "son chemin est : `pwd `/$f"
else
echo "erreur d'argument !"
fi

