================================================================================
                Airplane-Sleep v1.0 (macOS Catalina and Mojave)
                      by Patrick Kantorski; Jan 3, 2020
================================================================================

  Disable wifi and bluetooth when closing your MacBook or putting it to sleep!

================================================================================
>> Features:

This program is just a few simple commands that might help with saving battery
life. It should work on other versions of macOS and possibly linux. So
apparently wifi and bluetooth are still active when the MBP is closed and if 
you have something like Dropbox running, it could contribute to significant 
power drain. Turning the antennas off can save battery and prevent some data 
from being transferred during sleep mode.

================================================================================
>> Installation:

1. Open Terminal and type in

    chmod +x /Volumes/Airplane-Sleep/install.command

2. Double-click on the install.command file.

3. Allow the installer to everything.  You may be asked to change security 
preferences for "input monitoring" on your MacBook to allow sleepwatcher to 
function properly.

================================================================================
>> Uninstallation:

1. Open Terminal and type in

    chmod +x /Volumes/Airplane-Sleep/uninstall.command

2. Double-click on the uninstall.command file.

3. Allow the uninstaller to remove what ever you want.

================================================================================
>> Manual-Installation:

1. Run this command on Terminal to install the Homebrew package manager.

    /usr/bin/ruby -e "$(curl -fsSL 
    https://raw.githubusercontent.com/Homebrew/install/master/install)"

2. Install these two command-line tools for controling bluetooth and executing sleep commands.

    brew install blueutil
    brew install sleepwatcher
    brew services start sleepwatcher

  You may be asked to change security preferences for "input monitoring" on 
  your MacBook to allow sleepwatcher to function properly.

3. Press these keys to show hidden files on your computer.

    CMD + fn + shift + .

4. Move the hidden files ".sleep" and ".wakeup" into your user home directory.

    chmod +x ~/.sleep
    chmod +x ~/.wakeup

5. Now, if you want, you can press these keys again to hide hidden files.

    CMD + fn + shift + . 

Now when the computer sleeps, it will automatically disable wifi if it's on and 
bluetooth if it's on as well. If one of them are already turned off, it will 
remain off when sleep is disengaged.


================================================================================
>> Sidenote:

Hibernation is a super useful feature, especially with fast SSDs. It might also 
be worth changing the sleep standby delay before hibernation. These commands 
change the delay after sleeping to entering hibernation when on low power to 10 
minutes (600 sec) and when on high power to 20 minutes (1200 sec).

sudo pmset -a standbydelaylow 600
sudo pmset -a standbydelayhigh 1200

Disabling TurboBoost can also increase your battery but I doubt it will change 
anything with sleepmode... Still, it's worth checking out.

https://github.com/rugarciap/Turbo-Boost-Switcher