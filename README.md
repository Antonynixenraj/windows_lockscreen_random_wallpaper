# Automate Setting a Unique Randomized Lockscreen Wallpaper for Each Cycle Using JSON

This guide explains how to automate setting a unique randomized lockscreen wallpaper for each cycle from a folder on each login using JSON and PowerShell.

---

## Steps to Automate Setting a Randomized Lockscreen Wallpaper Image for Each Cycle

### 1. Run `json_creation.ps1` File
- If you're executing it for the first time, replace the image folder path and desired JSON file path in the `json_creation.ps1` file.
- Run the `json_creation.ps1` file in PowerShell to generate the JSON file.
- If your output is "Number of images from wallpaper folder" (e.g., `Number of images : 143`), then your JSON file is created in your given desired location.

---

### 2. Modify the Main Script
- Replace `<path_to_image_folder>` with the actual path to the folder containing your images.
- Replace `<json_file_path>` with the actual path to the JSON file.

---

### 3. Update Task Scheduler
- Open the provided `.xml` file and replace `<path_to_script>` in the **Argument** field with the actual path to the script. Use the comments in the file for guidance.
- Alternatively, follow the manual method described below:

#### Example Task Scheduler Configuration:
1. Open **Task Scheduler**.
2. Click on **Create Task**.
3. In the **General** tab:
   - Provide a name (e.g., `Set Random Lockscreen Wallpaper`).
   - Select **Run only when user is logged on**.
4. In the **Triggers** tab:
   - Click **New**.
   - Set **Begin the task** to `At log on`.
   - Select the user account.
5. In the **Actions** tab:
   - Click **New**.
   - Set **Action** to `Start a program`.
   - In **Program/script**, enter `powershell.exe`.
   - In **Add arguments**, enter:
     ```
     -ExecutionPolicy Bypass -File "<script_location>\set_random_lockscreen.ps1"
     ```
     Replace `<script_location>` with the actual path to the script.
6. Save the task.

---

### 4. Restart Your Computer
- The script should now work automatically, setting a random image from the specified folder as your lockscreen wallpaper.

---

## Notes
- Ensure that all your image folders contain only **image formats** (e.g., `.jpg`, `.png`, `.jpeg`) and no other file types.
- Verify that the script is correctly written and functional before importing it into Task Scheduler.
- Double-check all paths to avoid errors.
- This method is more efficient than other methods.

---

## Warning ⚠️
- **Once this script runs, the lockscreen wallpaper cannot be changed through the settings.**
- If you need to revert to the default lockscreen behavior (where the wallpaper can be changed through settings), follow these steps:

### 1. Delete the Task
   - Open **Task Scheduler**.
   - Click on **Task Scheduler Library**.
   - Delete the `Set Random Lockscreen Wallpaper` task. If you gave it a different name, delete the task with that name.

### 2. Delete the Registry Entry
   - Open **Regedit** (Registry Editor).
   - In the left panel, click on **Computer** and press **Ctrl + F** to open the search dialog.
   - Search for `PersonalizationCSP`. Ensure that only the **Keys** checkbox is selected, and deselect the others.
   - In the right panel, locate and delete the `LockScreenWallpaper` value.
   - Restart your computer.
   - You can now change the lockscreen wallpaper through the **Settings** app.

---

## Additional Information
For more details or alternative methods, refer to other commits in this project.
