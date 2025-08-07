# Microsoft 365 Apps Desktop - Uninstall & Cache Cleanup Guide

This guide provides step-by-step instructions for uninstalling **Microsoft 365 Apps Desktop** from **Windows 10 or Windows 11**, followed by running a cleanup script to remove leftover cache and configuration files.

---

## 🧹 Step 1: Uninstall Microsoft 365 Apps

1. Press `Windows + I` to open **Settings**.
2. Navigate to:
   - **Windows 11**: `Apps > Installed apps`
   - **Windows 10**: `Apps > Apps & features`
3. Find **Microsoft 365 Apps for enterprise** or **Microsoft Office** in the list.
4. Click the app → Select **Uninstall**.
5. Follow the prompts until the uninstall is complete.

---

## 🗑️ Step 2: Run the Cleanup Script

After Microsoft 365 is uninstalled, follow these steps to run the script and clear remaining cache files.

### A. Download the Repository as ZIP (Browser Method)

1. Visit this repository:  [https://github.com/egirizaki/clearCacheMicrosoft365](https://github.com/egirizaki/clearCacheMicrosoft365)
2. Click the **"Code"** button, then select **"Download ZIP"**.
3. Extract the downloaded ZIP file to any folder on your computer.
4. Open the extracted folder.

### 🖥️ B. Run the Batch Script

1. Locate the file named: `DeleteCacheOffice.bat`
2. **Right-click** on it → Select **"Run as administrator"**  
   > Administrator rights are required for full cleanup.
3. The script will automatically:
   - Clear cache for Microsoft Teams, Office, and OneDrive
   - Remove temporary files and some registry leftovers

---

## Important Notes

- Ensure Office is **fully uninstalled** before running the script.
- A system restart is recommended after running the cleanup.
- This helps to ensure a clean state before reinstalling Microsoft 365 or switching user profiles.

---

