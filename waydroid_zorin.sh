#bin/bash
user=$(whoami)
echo "Only run this script you have done the following: "
echo "I recommend to download the Gapps system.img "
echo "Make sure you extract both system.img & vendor.img and keep it in Downloads directory "
echo "It should like this"
echo "/home/$user/Downloads/system.img/vendor.img"

echo "Press any key to start the installation ..."
read -n 1 -s any_key_pressed
echo "Lelo"
#insatlling waydroid 
sudo apt install curl ca-certificates -y
sleep 1
curl https://repo.waydro.id | sudo bash
sleep 1
sudo apt install lzip git waydroid -y
git clone https://github.com/casualsnek/waydroid_script
sleep 1
#setting up waydroid 
sudo mkdir -p /usr/share/waydroid-extra/images
sleep 1
sudo mv /home/$user/Downloads/system.img /usr/share/waydroid-extra/images
sleep 1
sudo mv /home/$user/Downloads/vendor.img /usr/share/waydroid-extra/images

sleep 1

sudo waydroid init -f 
sleep 1
