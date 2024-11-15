#!/bin/bash

read -p  "Entrez  un nom pour la  clé ssh : " key_name
read -p  "Entrez le chemin de la clé ssh (par défaut ~/.ssh/id_rsa): " key_path
key_path=${key_path:-~/.ssh/$key_name}

if [ -f "$key_path" ]; then
    echo "La clé éxiste déjà à cet emplacement. Voulez-vous la remplacer ? (O/N)"
    read -p "Réponse : " answer
    if [[ ! "$answer" =~ ^[Oo]$ ]];
then
        echo " Opération annulée."
        exit 1
    fi
fi

# Génération de la clé SSH
echo "Génération de la clé SSH..."
ssh-keygen -t rsa -b 4096 -f  "$key_path" -N ""

echo "Clé générée avec succès à :  $key_path"
echo "Clé publique : $key_path.pub"

echo "<========================BEGIN KEY PUB========================>"
cat  $key_path.pub
echo "<========================END KEY PUB========================>"
eval $(ssh-agent)
ssh-add ~/.ssh/$key_name