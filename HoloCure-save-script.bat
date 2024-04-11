@echo off
setlocal enabledelayedexpansion

:menu
cls
echo 1. Copy save from this computer
echo 2. Put save file back to this computer
echo 3. Open Local folder
set /p choice="Enter your choice: "

if "%choice%"=="1" goto copy_save
if "%choice%"=="2" goto load_save
if "%choice%"=="3" goto open_folder
echo Invalid choice. Please try again.
timeout /t 2 >nul
goto menu

:copy_save
rem Check if the "HoloCure" folder exists
if not exist "C:\Users\%USERNAME%\AppData\Local\HoloCure" (
    echo HoloCure folder does not exist in the C:\Users\%USERNAME%\AppData\Local directory.
    goto end
)

rem Get current date and time
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YYYY=!dt:~0,4!"
set "MM=!dt:~4,2!"
set "DD=!dt:~6,2!"
set "HH=!dt:~8,2!"
set "MIN=!dt:~10,2!"
set "SEC=!dt:~12,2!"

rem Set destination folder name with date and time
set "destFolder=HoloCure_!DD!-!MM!-!YYYY!_!HH!-!MIN!-!SEC!"

rem Create destination folder if it doesn't exist
if not exist "%~dp0!destFolder!" mkdir "%~dp0!destFolder!"

rem Copy the HoloCure folder in the AppData\Local directory and rename it
xcopy /s /i /y "C:\Users\%USERNAME%\AppData\Local\HoloCure" "%~dp0!destFolder!"

echo Folder copied and renamed to %destFolder%
goto end


:load_save
rem Check if the "HoloCure" folder exists in the AppData\Local directory
if exist "C:\Users\%USERNAME%\AppData\Local\HoloCure" (
    choice /C YN /M "HoloCure save file already exists. Do you want to change it to HoloCure-Old and load your save "
    if errorlevel 2 goto exit

    rem Check if the "HoloCure-Old" folder exists
    if exist "C:\Users\%USERNAME%\AppData\Local\HoloCure-Old" (
	choice /C YN /M "HoloCure-Old save already exists. Do you want to replace it with exist HoloCure above "
            if errorlevel 2 goto exit
        rmdir /s /q "C:\Users\%USERNAME%\AppData\Local\HoloCure-Old"
    )

    rem Rename the existing "HoloCure" folder to "HoloCure-Old"
    ren "C:\Users\%USERNAME%\AppData\Local\HoloCure" "HoloCure-Old"
)
:get_save_file
rem Ask the user to choose a save file by dragging the folder into the console
set /p "saveFolder=Drag and drop the folder containing the save file here: "


rem Check if the provided save folder exists
if not exist "%saveFolder%" (
    echo Invalid save folder. Please try again.
    goto get_save_file
)

rem Copy the save folder to the AppData\Local directory and rename it to "HoloCure"
xcopy /s /i /y "%saveFolder%" "C:\Users\%USERNAME%\AppData\Local\HoloCure"

echo Save file loaded successfully.
goto end

:open_folder
explorer "C:\Users\%USERNAME%\AppData\Local"
goto end
:exit
echo You exit the script
pause

:end
pause


