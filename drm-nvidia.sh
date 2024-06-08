#!/usr/bin/env bash

if [ "$(id -u)" != "0" ]; then
    echo "This script requires superuser privileges. Please run it as root or using sudo."
    exit 1
fi

finish=0

show_menu() {
  clear
  echo "1. Check Nvidia DRM"
  echo "2. Install Nvidia DRM"
  echo "3. Uninstall Nvidia DRM"
  echo "4. Exit"
}

check_drm() {
  local res=$(cat /sys/module/nvidia_drm/parameters/modeset)
  if [ "$res" == 'Y' ]; then
    return 0
  else
    return 1
  fi
}

install_drm() {
  if ! check_drm; then
    echo "options nvidia_drm modeset=1" > /etc/modprobe.d/auto-nvidia-drm.conf
    echo "Nvidia DRM is installed. Please reboot your system"
  else
    echo "Nvidia DRM is already installed"
  fi
}

# find all files in /etc/modprobe.d witch contains options nvidia_drm modeset=1 and remove them lines
remove_drm() {
  if check_drm; then
    files=$(grep -rl 'options nvidia_drm modeset=1' /etc/modprobe.d)
    for file in $files; do
        sed -i '/options nvidia_drm modeset=1/d' "$file"
    done
    echo "Nvidia DRM is uninstalled. Please reboot your system"
  else
    echo "Nvidia DRM is not installed"
  fi
}

check_drm

while [ $finish ]; do
  show_menu
  read -p "Enter your choice: " choice
  case $choice in
    1)
      clear
      if check_drm; then
        echo "Nvidia DRM is enabled"
      else
        echo "Nvidia DRM is disabled"
      fi
      echo "Pres any key to back to menu..."
      read
      ;;
    2)
      clear
      install_drm
      echo "Press any key to continue..."
      read
      ;;
    3)
      clear
      remove_drm
      echo "Pres any key to back to menu..."
      read
      ;;
    4)
      echo "Exiting..."
      exit 0
      ;;
    *)
      echo "Invalid choice. Please try again."
      ;;
  esac
done