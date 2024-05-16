#!/bin/bash

# To find Waydroid directories 
check_waydroid_directories() {
    waydroid_dirs=$(ls -d ~/waydroid ~/.share/waydroid ~/.local/share/waydroid /var/lib/waydroid /usr/share/waydroid-extra/images 2>/dev/null)
    if [ -n "$waydroid_dirs" ]; then
        echo "Waydroid directories found:"
        echo "$waydroid_dirs"
        return 0
    else
        return 1
    fi
}

echo "This script will remove all Waydroid directories from your computer!"
echo "Do you want to continue? [yes/y] or [no/n]"
read answer1

if [[ "$answer1" == "yes" || "$answer1" == "y" ]]; then
    echo "(Double check) Do you want to continue? [yes/y] or [no/n]?"
    read answer2

    if [[ "$answer2" == "yes" || "$answer2" == "y" ]]; then
        if check_waydroid_directories; then
            echo "Removing files..."
            waydroid session stop
            sudo waydroid container stop
            sleep 1
            sudo apt remove waydroid -y
            sudo rm -rf ~/waydroid ~/.share/waydroid ~/.local/share/waydroid /var/lib/waydroid /usr/share/waydroid-extra/images ~/.local/share/applications/*aydroid* ~/.local/share/waydroid
            echo "Removed Waydroid files completely!"
        else 
            echo "No Waydroid directories found. Exiting..."
        fi
    else 
        echo "So you changed your mind!"
    fi
else 
    echo ""
fi
