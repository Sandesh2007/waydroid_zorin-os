#bin/bash
# user=$(whoami)
red="\e[31m"
 echo "Only run this script if you have done the following: "
 echo "I recommend to download the Gapps system.img "
 echo "Make sure you extract both system.img & vendor.img and keep it in Downloads directory "
 echo "It should like this"
 echo "/home/$user/Downloads/system.img|vendor.img"

 echo "Press any key to start the installation ..."
 read -n 1 -s any_key_pressed
#installing waydroid 
 sudo apt install curl ca-certificates -y
 sleep 1

 curl https://repo.waydro.id | sudo bash
 sleep 1

 sudo apt install lzip git waydroid -y
 sleep 1

 echo "Do you want to install Waydroid_scripts ? (yes/no)"
 read answer

 if [ "$answer" == "yes" ] || [ "$answer" == "y" ]; then
     git clone https://github.com/casualsnek/waydroid_script
     sleep 1
 else
     echo ""
   
# fi
#checking files is there or not 
check_system(){
    system="$HOME/Downloads/system.img"|| "$HOME/Downloads/System.img"
    
        if [ -f "$system" ]; then
            echo "found system.img at $HOME/Downloads/"
        else
            echo -e "$red _________________________________________________________________ \e[31m"
            echo -e "$red|No system.img file found at $HOME/Downloads/             |\e[31m"
            echo -e "$red|Did you moved the files to Downloads/ properly ?                 |\e[31m"
            echo -e "$red|Press 'r' to recheck if the file exists or any other key to exit.|\e[31m"
            echo -e "$red|_________________________________________________________________|\e[31m"
            read -n 1 -s answer
            if [ "$answer" == "r" ]; then
            check_system
        fi
    fi
}
check_vendor(){
    vendor="$HOME/Downloads/vendor.img"|| "$HOME/Downloads/Vendor.img"
    if [ -f "$vendor" ]; then
        echo "found vendor.img at $HOME/Downloads/"
    else
        echo -e "$red _________________________________________________________________\e[31m"
        echo -e "$red|No vendor.img file found at $HOME/Downloads/             |\e[31m"
        echo -e "$red|Did you moved the files to Downloads/ properly ?                 |\e[31m"
        echo -e "$red|Press 'r' to recheck if the file exists or any other key to exit.|\e[31m"
        echo -e "$red|_________________________________________________________________|\e[31m"
        read -n 1 -s answer
        if [ "$answer" == "r" ]; then
        check_vendor
        fi
    fi
}
check_waydroidscript(){
    wscript=$(find / -type d -name "waydroid_script" 2>/dev/null)
    if [ -n "$waydroid_dir" ]; then
        return 0
    else
        return 1
fi
}
check_system
check_vendor
#setting up waydroid 
sudo mkdir -p /usr/share/waydroid-extra/images
sleep 1

sudo mv /home/$user/Downloads/system.img /usr/share/waydroid-extra/images
sleep 1

sudo mv /home/$user/Downloads/vendor.img /usr/share/waydroid-extra/images
sleep 1

sudo waydroid init -f 
sleep 1

check_waydroidscript
if [ $? -eq 0 ]; then
    echo "found waydroid_script at: $waydroid_dir"
    echo "continue to waydroid scripts to install gapps/magisk/arms translator"
else
    echo "Script complete"
    echo "It is recommended to use waydroid script to install arm translator and gapps to install any arm/android app" 
fi