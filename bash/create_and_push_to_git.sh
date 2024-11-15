#!/bin/bash


if [ -z "$1" ]; then
   echo "Veuillez spécifier le nom du dépot local."
   exit 1
fi

read -p "Entrer le nom du repo distant : " REPO_NAME
# REPO_NAME="$1" 
REPO_USER="OusmanaTraore"
REMOTE_URL="git@github.com:$REPO_USER/$REPO_NAME.git" 
fichier_git=".git"
fichier_readme="README.md"

# Création du  repertoire local
mkdir "$REPO_NAME"
cd "$REPO_NAME"


# Initialiser le dépôt git
if [ ! -e "$fichier_git" ]; then
    git init
fi
echo "====================================="

# Création du fichier README.md
if [ ! -e "$fichier_readme" ]; then
    echo "# $REPO_NAME" > README.md
fi

git add README.md
git commit -m "Premier commit" 
git branch -M main

# Ajout du dépôt distant
git remote set-url origin "$REMOTE_URL"
git remote add origin "$REMOTE_URL"
# git remote add origin git@github.com:OusmanaTraore/PROJETS.git
echo "Liste de(s) dépot(s) local(aux)."
git remote -v

git fetch origin main
# Pousser le dépôt  local vers le dépôt  distant sur GitHub
git push -u origin  main

# echo "Le dépot local a été crée et poussé sur GitHub avec succès!"