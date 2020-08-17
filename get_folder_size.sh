#!/bin/bash
#Check folder size
echo Enter folder path ex. /mnt/user/FOLDER
read $folder
du -h --max-depth=0 $folder
