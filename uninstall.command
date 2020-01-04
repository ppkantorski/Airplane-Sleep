#!/bin/zsh
clear
echo "================================================================================"
echo "              Airplane-Sleep Uninstaller v1.0 by Patrick Kantorski"
echo "================================================================================"
echo " This uninstaller script removes Airplane-Sleep with custom options for"
echo " choosing what you want to remove."
echo "================================================================================"; sleep 1
echo
vared -p "> Want to remove Airplane-Sleep? (y|n): " -c tmp
sleep 2
if [[ $(ps -o comm= $PPID) = iterm ]]; then
	stty erase '^?'
fi

while [[ "$tmp" != "y" && "$tmp" != "Y" && "$tmp" != "n" && "$tmp" != "N" ]]; do
	unset tmp
	vared -p " > Please enter 'y' for 'yes' or 'n' for 'no'. (y|n): " -c tmp
	sleep 2
	if [[ $(ps -o comm= $PPID) = iterm ]]; then
		stty erase '^?'
	fi
done

if [[ "$tmp" == "y" || "$tmp" == "Y" ]]; then
	unset tmp
	echo
	echo "================================================================================"
	vared -p "> Remove configuration files? (y|n): " -c tmp
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
		echo " > Removing configuration files..."
		#/Volumes/Airplane-Sleep/
		rm -rf ~/.sleep
		echo " >" ~/.sleep is now removed.
		sleep 1
		rm -rf ~/.wakeup
		echo " >" ~/.wakeup is now removed.
		sleep 1
		rm -rf ~/.bluestatus
		echo " >" ~/.sleep is now removed.
		sleep 1
		rm -rf ~/.wifistatus
		echo " >" ~/.wakeup is now removed.
	fi
	
	if [[ "$tmp" == "n" || "$tmp" == "N" ]]; then
		unset tmp
	fi
	

	echo "================================================================================"
	vared -p "> Remove Homebrew packages? (y|n): " -c tmp
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
		echo " > Removing Homebrew packages.."
		brew remove blueutil
		brew services stop sleepwatcher
		brew remove sleepwatcher
		echo " > Homebrew packages have been removed!"
		sleep 2
	fi

	if [[ "$tmp" == "n" || "$tmp" == "N" ]]; then
		unset tmp
	fi
	

	echo "================================================================================"
	vared -p "> Remove Homebrew completely? (y|n): " -c tmp
	if [[ $(ps -o comm= $PPID) = iterm ]]; then
		stty erase '^?'
	fi
	#echo "================================================================================"; sleep 1

	
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
		echo " > Removing Homebrew."
		echo "================================================================================"; sleep 1
		
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
		
		echo "================================================================================"; sleep 1
		[ ! -f "`which brew`" ] && echo "> Homebrew has been removed!"
		
	fi
		
	if [[ "$tmp" == "n" || "$tmp" == "N" ]]; then
		unset tmp
	fi
	
	
	echo "================================================================================"
	echo "> Specified operations are complete! "
fi


unset tmp
echo "> Now exiting uninstaller..."
sleep 2
exit
