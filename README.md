# 🧹 CleanMac Installer

Automated macOS cleanup script with scheduled execution.  
This project helps you keep your Mac clean from caches, logs, and browser junk automatically every 2 weeks.

---

## ✨ Features
- Clear **system & user caches**  
- Remove **temporary files** and **logs**  
- Flush **DNS cache**  
- Cleanup **Xcode** build data, DerivedData, device support, and archives  
- Remove old **iOS backups**  
- Run **Homebrew cleanup** (if installed)  
- Clean **Microsoft Edge, Google Chrome, and Safari** caches, cookies, and temporary data  
- Schedule cleanup **every 2 weeks automatically** using `launchd`  

---

## 📦 Files
- `cleanmac` → the main cleanup script (bash)  
- `com.user.cleanmac.plist` → launchd configuration (runs script every 2 weeks at 9 AM)  
- `install_cleanmac.command` → installer (sets up everything for you)  

---

## 🚀 Installation

1. **Download the latest release**  
   Go to [Releases](../../releases) and grab the latest `.zip` or `.tar.gz`.

2. **Unzip the package** and open the folder:  
   ```bash
   cd ~/Downloads/cleanmac-install

3. Run the installer:
   
   ```bash
     chmod +x install_cleanmac.command
     ./install_cleanmac.command
  This will:
  
  Copy the cleanmac script to /usr/local/bin
  
  Copy the com.user.cleanmac.plist file to ~/Library/LaunchAgents/
  
  Load the job into launchd so it runs every 2 weeks automatically
  
4. ⚡ Manual Run
   
   ```bash
      cleanmac
5. 🔄 Schedule Details

    - Runs every 2 weeks
    - Executes at 9:00 AM
    - If your Mac is off, it runs at the next login
  
6. 🔔 Notifications
   
    After each run, the script prints logs to your terminal (when run manually).
    You can also check system logs for automated runs:
   ```bash
   log show --predicate 'process == "cleanmac"' --last 1d
7. ❓ FAQ

    Q: Will it delete my personal files?
    A: No — it only removes caches, logs, temp files, and browser junk.
   
    Q: Can I change the schedule?
    A: Yes — edit ~/Library/LaunchAgents/com.user.cleanmac.plist and adjust the <StartCalendarInterval> values.

    Q: How do I uninstall it?
    ```bash
      launchctl unload ~/Library/LaunchAgents/com.user.cleanmac.plist
      rm ~/Library/LaunchAgents/com.user.cleanmac.plist
      sudo rm /usr/local/bin/cleanmac
 
8. 📜 License
   
   MIT License.
   Use at your own risk — always back up your data before running system scripts.
