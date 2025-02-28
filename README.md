# Automate Setting a Unique Randomized Lockscreen Wallpaper for Each Cycle

This guide explains how to automate setting a unique randomized lockscreen wallpaper for each cycle from a folder on each login.

---

## Steps to Automate Setting a Randomized Lockscreen Wallpaper Image for Each Cycle

1. **Create Folders**:
   - Create a folder named `Upcoming_Wallpaper`.
   - Create a folder named `Current_Wallpaper`:
     - After the script runs, the current lockscreen wallpaper will be saved in this folder.

2. **Copy Images**:
   - If this is your first time, copy all images from the actual image path to the `Upcoming_Wallpaper` folder.

3. **Modify the Script**:
   - Replace `<path_to_image_folder>` with the actual path to the folder containing your images.
   - Replace `<script_location>` with the actual location where the script file is saved.
   - Replace `<Upcoming_Wallpaper_Folder>` with the actual path to the `Upcoming_Wallpaper` folder.
   - Replace `<Current_Wallpaper_Folder>` with the actual path to the `Current_Wallpaper` folder.

4. **Update Task Scheduler**:
   - Open the provided `.xml` file and replace `<path_to_script>` in the **Argument** field with the actual path to the script. Use the comments in the file for guidance.

5. **Import into Task Scheduler**:
   - Import the script into Task Scheduler and configure it to run at your desired frequency (e.g., on each login). Before this step, ensure you have followed the previous step to replace the placeholders.

6. **Restart Your Computer**:
   - The script should now work automatically, setting a random image from the specified folder as your lockscreen wallpaper.

---

## Notes

- Ensure that all your image folders contain only **image formats** (e.g., `.jpg`, `.png`, `.jpeg`) and no other file types.
- Ensure the script is correctly written and functional before importing it into Task Scheduler.
- Double-check all paths to avoid errors.
- This method is not storage-efficient and consumes more storage compared to other methods.
- If you are not satisfied with this method, check out other approaches in my other commits for this project.

---

## Warning

- **If this script runs, the lockscreen wallpaper cannot be changed through the settings.**
- If you need to revert to the default lockscreen behavior (where the wallpaper can be changed through settings), follow these steps:

### 1. Delete the Task
   - Go to **Task Scheduler**.
   - Click on **Task Scheduler Library**.
   - Delete the `Set Random Lockscreen Wallpaper` task. If you gave it a different name, delete the task with the name you assigned.

### 2. Delete the Registry Entry
   - Open **Regedit** (Registry Editor).
   - In the left panel, click on **Computer** and press **Ctrl + F** to open the search dialog.
   - Search for `PersonalizationCSP`. Ensure that only the **Keys** checkbox is selected, and disable the other checkboxes.
   - In the right panel, locate and delete the `LockScreenWallpaper` value.
   - Restart your computer.
   - Now you can change the lockscreen wallpaper through the **Settings** app.

---

## Additional Information

For more details or alternative methods, refer to the other commits in this project.