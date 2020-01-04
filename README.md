# Airplane-Sleep (macOS Catalina and Mojave)
Disable wifi and bluetooth when closing your MacBook or putting it to sleep!

# Features
Here's a few simple commands that might help with saving battery life.  It should work on other versions of macOS and possibly linux.  So apparently wifi and bluetooth are still active when the MBP is closed and if you have something like Dropbox running, it could contribute to significant power drain.  Turning the antennas off can save battery and prevent some data from being transferred during sleep mode.

# Installation

1. Mount Airplane-Sleep.dmg.  You may need to make the installer executable.  Open Terminal then type in

```bash
chmod +x /Volumes/Airplane-Sleep/install.command
```

2. Double-click on the install.command file.

3. Allow the installer to everything.  You may be asked to change security preferences for "input monitoring" on your MacBook to allow the Homebrew package "sleepwatcher" to function properly.

# Uninstallation

1. Open Terminal and type in

```bash
chmod +x /Volumes/Airplane-Sleep/uninstall.command
```

2. Double-click on the uninstall.command file.

3. Allow the uninstaller to remove what ever you want from what was installed.


# Manual Installation

1. Run command on Terminal to install the Homebrew package manager.

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

2. Install command-line tools for controling bluetooth and executing sleep commands.

```bash
brew install blueutil
brew install sleepwatcher
brew services start sleepwatcher
```

You may be asked to change security preferences for "input monitoring" on your MacBook to allow sleepwatcher to function properly.


3. Move the hidden files ".sleep" and ".wakeup" from the .dmg into your user home directory.  Initialize file for ".bluestatus" and ".wifistatus".  Change permissions for each file.

```bash
cp /Volume/Airplain-Sleep/.sleep ~/
cp /Volume/Airplain-Sleep/.wakeup ~/

echo 0 > ~/.bluestatus 
echo 0 > ~/.wifistatus

chmod +x ~/.sleep
chmod +x ~/.wakeup
chmod +x ~/.bluestatus
chmod +x ~/.wifistatus
```


Now when the computer sleeps, it will automatically disable wifi if it's on and bluetooth if it's on as well.  If one of them are already turned off, it will remain off when sleep is disengaged.

# Sidenote

Hibernation is a super useful feature, especially with fast SSDs.  It might also be worth changing the sleep standby delay before hibernation.  These commands change the delay after sleeping to entering hibernation when on low power to 10 minutes (600 sec) and when on high power to 20 minutes (1200 sec).


```bash
sudo pmset -a standbydelaylow 600
sudo pmset -a standbydelayhigh 1200
```

Disabling TurboBoost can also increase your battery but I doubt it will change anything with sleepmode...  Still, it's worth checking out.

https://github.com/rugarciap/Turbo-Boost-Switcher
