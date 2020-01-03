# Airplane-Sleep (macOS Catalina and Mojave)
Disable wifi and bluetooth when closing your MacBook or putting it to sleep!

=================================================================================

Here's a few simple commands that might help with saving battery life.  It should work on other versions of macOS and possibly linux.  So apparently wifi and bluetooth are still active when the MBP is closed and if you have something like Dropbox running, it could contribute to significant power drain..  Turning the antennas off can save battery and prevent some data from being transferred during sleep mode.

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

You may be asked to change security preferenaces for "input monitoring" on your MacBook to allow sleepwatcher to function properly.


3. Press these keys to show hidden files on your computer.

```
CMD + fn + shift + .
```


4. Rename "sleep" to ".sleep" and "wakeup" to ".wakeup" them move the files into your user home directory.  Run these commands within the user home directory (~/) to change permissions for execution.

```bash
chmod +x .sleep
chmod +x .wakeup
```


5. Now, if you want, you can press these keys again to hide hidden files.

```
CMD + fn + shift + . 
```

Now when the computer sleeps, it will automatically disable wifi if it's on and bluetooth if it's on as well.  If one of them are already turned off, it will remain off when sleep is disengaged.

Sidenote:

It might also be worth changing the sleep standby delay before hibernation. These commands change the standbydelay when on low power to 10 minutes (600 sec) and when on high power to 20 minutes (1200 sec).  Hibernation is a super useful feature, especially with fast SSDs.


```bash
sudo pmset -a standbydelaylow 600
sudo pmset -a standbydelayhigh 1200
```
