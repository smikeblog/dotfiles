read -p "Please input your email: " email
echo "Generating ssh key for " $email
ssh-keygen -t rsa -b 4096 -C "$email"
echo "Making sure ssh-agent is on"
eval "$(ssh-agent -s)"
echo "Adding the key to ssh-agent"
ssh-add ~/.ssh/id_rsa
echo "Done! Paste the public key below to GitHub:"
echo ""
cat ~/.ssh/id_rsa.pub
echo ""
