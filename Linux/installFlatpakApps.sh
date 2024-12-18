#!/bin/bash

# Declare an associative array with app IDs and corresponding permissions
declare -A flatpak_apps
flatpak_apps=(
    ["com.telegram.desktop"]="telegram"
    ["com.visualstudio.code"]="vscode"
)

# Function to install a Flatpak app if it's not installed
install_flatpak_app() {
    app_id=$1
    echo "Checking if $app_id is installed..."
    flatpak list --app | grep -q "$app_id" || {
        echo "$app_id is not installed. Installing now..."
        flatpak install -y flathub "$app_id"
    }
}

# Install Flatpak apps and apply configurations
for app_id in "${!flatpak_apps[@]}"; do
    # Install the app
    install_flatpak_app "$app_id"
    echo "Applying permissions for $app_id..."
    flatpak override --user --filesystem=home "$app_id"
done
