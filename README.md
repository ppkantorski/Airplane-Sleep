# Airplane-Sleep (macOS)
Disable wifi and bluetooth when closing your MacBook or putting it to sleep!

=================================================================================

Hey so I wrote a few simple commands that might help with saving battery life.  Apparently wifi and bluetooth are still active when the MBP is closed and if you have something like Dropbox running, it could contribute to significant power drain..  Turning the antennas off can save battery and prevent some data from being transferred during sleep mode.

=================================================================================


1. Run this command on Terminal to install the Homebrew package manager.

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

2. Install these two command-line tools for controling bluetooth and executing sleep commands.

```bash
brew install blueutil
brew install sleepwatcher
brew services start sleepwatcher
```

You may be asked to change security preferenaces for "input monitoring" on your MacBook to allow sleepwatcher to function properly


3. Now you want to show hidden files

    Press "CMD + fn + shift + ."


4. Move the ".sleep" and ".wakeup" files in the .zip file to your user home directory and run these commands to change permissions


5. Now you can to hide hidden files.

    Press "CMD + fn + shift + . "


Now when the computer sleeps, it will automatically disable wifi if it's on and bluetooth if it's on as well.  If one of them are already turned off, it will remain off when sleep is disengaged.
