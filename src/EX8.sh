############# SCC2015 #############
#############  OSSEC  #############
##### Baroudi Safwene - Team 3 #####

#EX - 8 - 9pts - Développer un petit jeu VT (vache torreau) par un script shell.
#Principe : la machine choisit un nombre aléatoire de 4 chiffres distincts, le joueur essaye de deviner ce nombre avec 7 tentatives au maximum sinon il a perdu le jeu..#


#1er argument fichier.c ou .cpp
#2éme argument fichier input
min=1000
max=9999
numcomp=$[($RANDOM % ($[$max -$min] + 1))+$min]
teste=1
u=`expr $numcomp % 10`
d=`expr $numcomp / 10 % 10`
c=`expr $numcomp / 100 % 10`
m=`expr $numcomp / 1000`
for i in `seq 7`
do
    V=0
    T=0
    echo "estimez mon num "
    read num
    if [ $num -eq $numcomp ]
    then
        echo "bravo ! "
        teste=0
        break 
    else
        uu=`expr $num % 10`
        dd=`expr $num / 10 % 10`
        cc=`expr $num / 100 % 10`
        mm=`expr $num / 1000`

        if [ $uu -eq $u ]
        then
            T=`expr $T + 1`
        fi
        if [ $dd -eq $d ]
        then
            T=`expr $T + 1`
        fi
        if [ $cc -eq $c ]
        then
            T=`expr $T + 1`
        fi
        if [ $mm -eq $m ]
        then
            T=`expr $T + 1`
        fi

        if [ $uu -eq $c -o $uu -eq $d -o $uu -eq $m  ]
        then
            V=`expr $V + 1`
        fi

        if [ $dd -eq $c -o $dd -eq $u -o $dd -eq $m  ]
        then
            V=`expr $V + 1`
        fi

        if [ $cc -eq $u -o $cc -eq $d -o $cc -eq $m  ]
        then
            V=`expr $V + 1`
        fi

        if [ $mm -eq $c -o $mm -eq $d -o $uu -eq $u  ]
        then
            V=`expr $V + 1`
        fi
        echo "$T taureaux et $V vaches"
    fi
done
if [ $teste -eq 1 ]
then
    echo tu as perdu 
fi
