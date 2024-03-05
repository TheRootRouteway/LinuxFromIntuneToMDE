#!/bin/bash

#Delete the offboarding json file if it already exists 
file_path="/etc/opt/microsoft/mdatp/mdatp_offboard.json"

if [ -e "$file_path" ];  then
    rm "$file_path"
    echo "File $file_path deleted"
else

    echo "File $file_path didn't exist."
fi

cd $HOME

#Delete onboarding script if it already exists
file_path2="./MicrosoftDefenderATPOnboardingLinuxServer.py"
if [ -e "$file_path2" ];  then
    rm MicrosoftDefenderATPOnboardingLinuxServer.py*
    echo "File $file_path2 deleted"
else

    echo "File $file_path2 didn't exist."
fi


wget http://IP_ADDRESS/MicrosoftDefenderATPOnboardingLinuxServer.py

chmod u+x $HOME/MicrosoftDefenderATPOnboardingLinuxServer.py

sudo python3 $HOME/MicrosoftDefenderATPOnboardingLinuxServer.py


