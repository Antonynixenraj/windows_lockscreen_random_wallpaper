# Automate Setting a Randomized Lockscreen Wallpaper

This guide explains how to automate setting a randomized image as your lockscreen wallpaper from a folder on each login.

---

## Steps to Automate Setting a Randomized Lockscreen Wallpaper

1. **Modify the Script**:
   - Replace `<path_to_image_folder>` with the actual path to the folder containing your images.
   - Replace `<script_location>` with the actual location where the script file is saved.

2. **Update Task Scheduler**:
   - Open the given .xml file and replace `<path_to_script>` in the **Argument** field with the actual path to the script where I use comments to know.

3. **Import into Task Scheduler**:
   - Import the script into Task Scheduler and configure it to run at your desired frequency (e.g., on each login). Before this step, ensure you have followed the previous step to replace the placeholders.

4. **Restart Your Computer**:
   - The script should now work automatically, setting a random image from the specified folder as your lockscreen wallpaper.

---

## Notes

- Ensure in your image folder has no other file formats except **image format** like jpg,png,jpeg... .
- Ensure the script is correctly written and functional before importing it into Task Scheduler.
- Double-check all paths to avoid errors.
- This method might repeat the same image within a short period.
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