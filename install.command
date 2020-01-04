#!/bin/zsh
clear
echo "================================================================================"
echo "              Airplane-Sleep Installer v1.0 by Patrick Kantorski"
echo "================================================================================"
echo " This installer only installs trusted Homebrew packages along with the custom "
echo " configuration files for toggling bluetooth and wifi during sleep-mode."
echo "================================================================================"; sleep 1
echo
vared -p "> Install packages and configurations? (y|n): " -c tmp
sleep 2
if [[ $(ps -o comm= $PPID) = iterm ]]; then
	stty erase '^?'
fi

while [[ "$tmp" != "y" && "$tmp" != "Y" && "$tmp" != "n" && "$tmp" != "N" ]]; do
	unset tmp
	vared -p " > Please enter 'y' for yes or 'n' for no. (y|n): " -c tmp
	sleep 2
	if [[ $(ps -o comm= $PPID) = iterm ]]; then
		stty erase '^?'
	fi
done

if [[ "$tmp" == "y" || "$tmp" == "Y" ]]; then
	unset tmp
	echo "================================================================================"
	echo " > Checking for Homebrew"
	echo "================================================================================"; sleep 1
	echo
	
	[ ! -f "`which brew`" ] && echo "> Homebrew is not installed."
	[ ! -f "`which brew`" ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	
	
	[ ! -f "`which brew`" ] && echo "> Homebrew is still not installed! "
	[ ! -f "`which brew`" ] && echo ">  Please manually install Homebrew. Exiting..." && sleep 3 && exit
	
	echo; sleep 2
	echo "================================================================================"
	echo " > Installing Homebrew packages"
	echo "================================================================================"; sleep 1
	echo
	brew install blueutil
	brew install sleepwatcher
	
	echo; sleep 2
	echo "================================================================================"
	echo " > Installing configuration files"
	echo "================================================================================"; sleep 1
	echo
	cp $(dirname "$0")/.sleep ~/
	echo ">" sleep config stored to ~/.sleep
	sleep 1
	chmod +x ~/.sleep; echo "> .sleep is now executable! "
	sleep 1
	cp $(dirname "$0")/.wakeup ~/
	echo ">" wakeup config stored to ~/.wakeup
	
	chmod +x ~/.wakeup; echo "> .wakeup is now executable! "
	sleep 1

	
	echo "> Generating initial .bluestatus and .wifistatus config files... "
	sleep 1
	echo $(blueutil -p) > ~/.bluestatus; chmod +x ~/.bluestatus
	ping -c 1 google.com ;  echo $? > ~/.wifistatus; chmod +x ~/.wifistatus
	echo "> .bluestatus and .wifistatus are now in home directory! "
	
	echo; sleep 2
	echo "================================================================================"
	echo " > Initializing sleepwatcher service..."
	echo "================================================================================"; sleep 1
	echo
	
	brew services start sleepwatcher
	
	echo; sleep 1
	echo "================================================================================"
	echo "> Installation is complete! "
fi

unset tmp

echo; sleep 1
echo "> Now exiting installer..."
echo "================================================================================"
sleep 1
exit
