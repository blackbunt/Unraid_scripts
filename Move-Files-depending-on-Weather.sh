#!/bin/bash
# This script fetches the Temperatur at a given Location and moves files/folders
#if the temperature is below a user selected treshold.
#
# Set Location
location=$'YOUR_LOCATION'
# upper treshold in °C
upper_treshold=$'25'
# source_folder
source=$''
destination=$''
# url wttr.in/YOU'R LOACTION?format=%t | grep -Eo '[0-9]{1,2}'
URL="http://wttr.in/${location}?format=%t"
# get raw temp and store cleaned value
temp=$(curl $URL | grep -Eo '[0-9]{1,2}')
echo Aktuell sind es in $location $temp °C.
echo Die maximale Temperatur zum kopieren betraegt $upper_treshold °C.

if [[ $upper_treshold -ge $temp ]]; then
  #wenn temp unter obergrenze, dann move files.
  echo es ist kuehl genug, also los:
  cd $source/Folder1
  find -name '*' -exec mv -v {}  $destination/Folder1 \;
  rm -R -- */
  echo krams in Folder1 verschoben!
  cd $source/Folder2
  find -name '*' -exec mv -v {}  $destination/Folder2 \;
  rm -R -- */
  echo krams in Folder2 verschoben!
fi

if [[ $temp -ge $upper_treshold ]]; then
  echo Es ist zu warm.
fi
