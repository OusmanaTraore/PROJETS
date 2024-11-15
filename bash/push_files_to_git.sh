echo "================= STATUS ==================="
git status

echo "================= BRANCHES ==================="
git branch

echo "================= Fichiers à commiter ==================="
read -p  "Entrez  les fichiers à commiter : " file_name
$file_name
git add $file_name

echo "================= Message du commit ==================="
read -p  "Entrez le message pour le commit : " msg
$msg
git commit -m  $msg
echo "================= Push sur repoGit ==================="
echo "Push..."
git push -u origin master