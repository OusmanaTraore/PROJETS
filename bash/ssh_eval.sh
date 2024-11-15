

eval $(ssh-agent)
echo " Liste de clé(s) disponible(s)"
ls ~/.ssh/
read -p "Entrer la clé ssh : " key_name
ssh-add ~/.ssh/$key_name

echo "============================="
chmod 700 ~/.ssh 
chmod 600 ~/.ssh/authorized_keys
cat ~/.ssh/$key_name.pub >  ~/.ssh/authorized_keys
cat ~/.ssh/authorized_keys