### Info

This batch script provides functionality to manage save files for a game named "HoloCure" on a Windows system. It allows users to copy save files from their computer, load save files to their computer, and open the local directory where the save files are stored.

#### Option explain:
1. **Copy Save file**:
   - Select option 1 from the menu to copy the save files from the local directory to a new folder with a timestamp in the same directory as the script.
   - This option creates a backup of the current save files in a new folder.

2. **Load Save File**:
   - Select option 2 from the menu to load save files from a specified folder to the local directory.
   - If a previous save exists, the script will ask to rename it with a backup folder named "HoloCure-Old. at local directory"
   - If a Holocure-Old folder exist, the script will ask to delete HoloCure-Old folder and rename the exist Holocure folder to HoloCure-Old
   - You need to drag and drop the folder containing the save file into the console to choose which save you want to load.

3. **Open Local Folder**:
   - Select option 3 from the menu to open the local directory where the save files are stored in File Explorer.

#### Instructions:
- Download file in release.
- Follow the on-screen menu to choose the desired action (copy save, load save, or open folder).
- The script will provide prompts for user input and perform the selected action accordingly.

#### Warning:
- Ensure proper backup of save files before performing any operations, especially when replacing existing saves.
