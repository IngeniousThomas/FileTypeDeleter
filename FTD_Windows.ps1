# File Type Deleter - PowerShell Version
Clear-Host
Write-Host "----------------------------" -ForegroundColor Green
Write-Host "Welcome to File Type Deleter" -ForegroundColor Cyan
Write-Host "----------------------------" -ForegroundColor Green
Write-Host "Made by Arun Thomas" -ForegroundColor Yellow
Write-Host "`nThis tool deletes files of specific extensions from a selected folder." -ForegroundColor White

function Pause($message) {
    Write-Host "$message"
    Read-Host "Press Enter to continue..."
}

Pause "Use this script carefully!"

while ($true) {
    # Ask for folder path
    $folder_path = Read-Host "Enter the full path of the folder"

    # Validate folder path
    if (!(Test-Path -Path $folder_path -PathType Container)) {
        Write-Host "Invalid folder path. Please try again." -ForegroundColor Red
        Pause ""
        continue
    }

    # Ask for file extensions
    $extensions = Read-Host "Enter CASE-SENSITIVE file extensions to delete (comma-separated, e.g., mov,MOV,json,JSON,txt,TXT)"

    # Check if extensions are provided
    if ([string]::IsNullOrWhiteSpace($extensions)) {
        Write-Host "No extensions provided. Please enter at least one file extension." -ForegroundColor Red
        Pause ""
        continue
    }

    # Confirm user input
    Write-Host "`nYou selected the folder: $folder_path" -ForegroundColor Cyan
    Write-Host "You want to delete files with extensions: $extensions" -ForegroundColor Yellow
    $confirm = Read-Host "Proceed with deletion? (y/n)"

    if ($confirm -notmatch "^[Yy]$") {
        Write-Host "Operation canceled." -ForegroundColor Red
        Pause ""
        continue
    }

    # Delete files
    $files_deleted = $false
    $ext_array = $extensions -split ","
    foreach ($ext in $ext_array) {
        $files = Get-ChildItem -Path $folder_path -Recurse -Filter "*.$ext" -File
        if ($files.Count -gt 0) {
            $files | Remove-Item -Force
            $files_deleted = $true
        }
    }

    # Show appropriate message
    if ($files_deleted) {
        Write-Host "Files with extensions ($extensions) have been successfully deleted from: $folder_path" -ForegroundColor Green
    } else {
        Write-Host "No files with extensions ($extensions) were found in: $folder_path" -ForegroundColor Red
    }

    # Ask if the user wants to repeat the process
    $repeat = Read-Host "Do you want to delete files from another folder? (y/n)"
    if ($repeat -notmatch "^[Yy]$") {
        Write-Host "Thank you for using this tool!" -ForegroundColor Cyan
        exit
    }
}
