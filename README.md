Powershell-rsync
================

Powershell script for syncing directories with rsync. It checks in a directory for the subfolders and files and
if the files exceed a limit (e.g 1000) then it goes recursive inside the directory and for every subdirectory starts
from the beginning. 

I tried to develop a multi running rsync for every directory hoping to be faster.
In the current state the script it only shows messages at the point where it should call rsync commands on the
directory that it should call it.