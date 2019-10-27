#!/bin/bash

sshs(){
    OIFS="$IFS"
    IFS=$'\n'
    for l in $(cat ~/.ssh/config | grep -i "$1" | grep "#")
    do
        echo ${l:5}
    done
    IFS=$OIFS
    read -p "Elige host: " host
    host=$(grep "# ($host)" ~/.ssh/config | cut -d" " -f 2)
    if [ "$host" != "" ]
    then
        echo "Conectando a $host ..."
        ssh $host
    else
        echo "No se ha seleccionado ningún host"
    fi
}

sshs $1
