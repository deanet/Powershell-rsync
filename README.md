Powershell-rsync
================

Powershell script for syncing directories with rsync. It checks in a directory for the subfolders and files and
if the files exceed a limit (e.g 1000) then it goes recursive inside the directory and for every subdirectory starts
from the beginning. 

I tried to develop a multi running rsync for every directory hoping to be faster.
In the current state the script it only shows messages at the point where it should call rsync commands on the
directory that it should call it.

To create test folders with the files run in cmd the following

for /l %n in (1,1,100) do echo This is a test message >> "C:\Users\User\Desktop\test\100\test%n.txt"
This will create 100 text files with the message inside and will save them to the location you declare. 
You can change the 100 or the destination on whatever you like.