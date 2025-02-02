#!/bin/bash

# Function to display a message and wait for Enter
pause() {
    echo "$1"
    read -p "Press Enter to continue..." dummy
}

# Welcome message
clear
echo "----------------------------"
echo "Welcome to File Type Deleter"
echo "----------------------------"
echo "Made by Arun Thomas"
echo
echo "This tool deletes files of specific extensions from a selected folder."
pause "Use this script carefully!"

while true; do
    # Ask user for the folder path
    read -p "Drag & Drop (or) Enter the full path of the folder: " folder_path

    # Validate the folder path
    if [ ! -d "$folder_path" ]; then
        echo "Invalid folder path. Please try again."
        pause
        continue
    fi

    # Ask user for file extensions
    read -p "Enter CASE-SENSITIVE file extensions to delete (multiple can be comma-separated, e.g., mov, MOV, json, JSON, txt, TXT): " extensions

    # Check if extensions are provided
    if [[ -z "$extensions" ]]; then
        echo "No extensions provided. Please enter at least one file extension."
        pause
        continue
    fi

    # Confirm user input
    echo
    echo "You selected the folder: $folder_path"
    echo "You want to delete files with extensions: $extensions"
    read -p "Proceed with deletion? (y/n): " confirm

    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        # Process the extensions and delete files
        IFS=',' read -ra ext_array <<< "$extensions"
        files_found=false
        for ext in "${ext_array[@]}"; do
            # Check if any files exist before deleting
            if find "$folder_path" -type f -name "*.${ext// /}" | grep -q .; then
                find "$folder_path" -type f -name "*.${ext// /}" -exec rm -f {} \;
                files_found=true
            fi
        done

        # Show appropriate message
        if $files_found; then
            echo "Files with extensions ($extensions) have been successfully deleted from: $folder_path"
        else
            echo "No files with extensions ($extensions) were found in: $folder_path"
        fi
    else
        echo "Operation canceled."
    fi

    # Ask if the user wants to repeat the process
    read -p "Do you want to delete files from another folder? (y/n): " repeat
    if [[ ! "$repeat" =~ ^[Yy]$ ]]; then
        echo "Thank you for using this tool!"
        exit 0
    fi
done
