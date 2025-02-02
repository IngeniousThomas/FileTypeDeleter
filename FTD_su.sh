#!/bin/bash

# Function to check and install Homebrew
install_homebrew() {
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        if [ $? -ne 0 ]; then
            echo "Failed to install Homebrew. Exiting." >&2
            exit 1
        fi
        echo "Homebrew installed successfully."
    else
        echo "Homebrew is already installed."
    fi
}

# Function to check and install dialog
install_dialog() {
    if ! command -v dialog &> /dev/null; then
        echo "'dialog' utility not found. Installing 'dialog'..."
        if ! command -v brew &> /dev/null; then
            echo "Homebrew is required but not installed. Exiting." >&2
            exit 1
        fi
        brew install dialog
        if [ $? -ne 0 ]; then
            echo "Failed to install 'dialog'. Exiting." >&2
            exit 1
        fi
        echo "'dialog' installed successfully."
    else
        echo "'dialog' is already installed."
    fi
}

# Function to ensure sudo privileges
ensure_sudo() {
    if [ "$EUID" -ne 0 ]; then
        echo "This script requires administrative privileges. Please enter your password."
        sudo -v
        if [ $? -ne 0 ]; then
            echo "Failed to obtain sudo privileges. Exiting." >&2
            exit 1
        fi
    fi
}

# Install Homebrew and dialog
ensure_sudo
install_homebrew
install_dialog

# Welcome screen
dialog --title "----------------------------" --ok-label "OK" --msgbox "Welcome to File Type Deleter\n\nMade by Arun Thomas\n\nThis tool deletes files of specific extensions from a selected folder. Use this script carefully!" 12 50

# Main process loop
while true; do
    # Ask user for the folder path
    folder_path=$(dialog --title "Select Folder" --ok-label "OK" --inputbox "Drag & Drop (or) Enter the full path of the folder:" 10 60 "" 3>&1 1>&2 2>&3)

    if [[ $? -ne 0 ]]; then
        dialog --title "Exit" --msgbox "Exiting the script. Goodbye!" 8 50
        clear
        exit 0
    fi

    # Remove trailing spaces from folder path
    folder_path=$(echo "$folder_path" | sed 's/[[:space:]]*$//')

    # Validate folder path
    if [ ! -d "$folder_path" ]; then
        dialog --title "Error" --msgbox "Invalid folder path. Please try again." 8 50
        continue
    fi

    # Prompt user for file extensions
    extensions=$(dialog --title "File Extensions" --ok-label "OK" --inputbox "Enter CASE-SENSITIVE file extensions to delete (multiple can be comma-separated, e.g., mov, MOV, json, JSON, txt, TXT):" 12 60 "" 3>&1 1>&2 2>&3)

    if [[ $? -ne 0 ]]; then
        dialog --title "Exit" --msgbox "Exiting the script. Goodbye!" 8 50
        clear
        exit 0
    fi

    # Check if extensions are provided
    if [[ -z "$extensions" ]]; then
        dialog --title "Error" --msgbox "No extensions provided. Please enter at least one file extension." 8 50
        continue
    fi

    # Confirm user input
    dialog --title "Confirm Action" --yesno "You selected the folder:\n\n$folder_path\n\nYou want to delete files with extensions:\n\n$extensions\n\nProceed?" 15 50
    response=$?

    if [[ $response -eq 0 ]]; then
        # Process the extensions and delete files
        IFS=',' read -ra ext_array <<< "$extensions"
        files_found=false
        for ext in "${ext_array[@]}"; do
            if find "$folder_path" -type f -name "*.${ext// /}" | grep -q .; then
                find "$folder_path" -type f -name "*.${ext// /}" -exec rm -f {} \;
                files_found=true
            fi
        done

        # Show appropriate message
        if $files_found; then
            dialog --title "Success" --msgbox "Files with extensions ($extensions) have been successfully deleted from:\n\n$folder_path" 10 50
        else
            dialog --title "Error" --msgbox "No files with extensions ($extensions) were found in:\n\n$folder_path" 10 50
        fi
    else
        dialog --title "Exit" --msgbox "Operation canceled. Exiting the script. Goodbye!" 8 50
        clear
        exit 0
    fi

    # Ask if the user wants to repeat the process
    dialog --title "Repeat Process" --yesno "Do you want to delete files from another folder?" 8 50
    if [[ $? -ne 0 ]]; then
        dialog --title "Thank You" --msgbox "Thank you for using this tool!" 8 50
        clear
        exit 0
    fi
done
