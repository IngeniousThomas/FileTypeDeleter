@echo off
title File Type Deleter
echo ----------------------------
echo Welcome to File Type Deleter
echo ----------------------------
echo Made by Arun Thomas
echo.
echo This tool deletes files of specific extensions from a selected folder.
pause

:main
cls
:: Ask for the folder path
set /p folder_path="Enter the full path of the folder: "
if not exist "%folder_path%" (
    echo Invalid folder path. Please try again.
    pause
    goto main
)

:: Ask for file extensions
set /p extensions="Enter CASE-SENSITIVE file extensions to delete (comma-separated, e.g., mov,MOV,json,JSON,txt,TXT): "

:: Check if extensions are provided
if "%extensions%"=="" (
    echo No extensions provided. Please enter at least one file extension.
    pause
    goto main
)

:: Confirm user input
echo.
echo You selected the folder: %folder_path%
echo You want to delete files with extensions: %extensions%
set /p confirm="Proceed with deletion? (y/n): "
if /i not "%confirm%"=="y" (
    echo Operation canceled.
    pause
    goto main
)

:: Delete files
set files_deleted=0
for %%x in (%extensions%) do (
    if exist "%folder_path%\*.%%x" (
        del /s /q "%folder_path%\*.%%x"
        set /a files_deleted+=1
    )
)

:: Show result
if %files_deleted% gtr 0 (
    echo Files with extensions (%extensions%) have been successfully deleted from: %folder_path%
) else (
    echo No files with extensions (%extensions%) were found in: %folder_path%
)

:: Ask if the user wants to repeat the process
set /p repeat="Do you want to delete files from another folder? (y/n): "
if /i "%repeat%"=="y" goto main

echo Thank you for using this tool!
exit
