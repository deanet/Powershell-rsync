Function countfds($dir)
{
	$dircount=0
	$filescount=0

	#Pairnaei tin lista me tous fakelous sto $currentdir
	$currentdir = Get-ChildItem -Recurse -Path $dir

	#Gia kathe ena antikeimeno mesa stin lista elegxei an einai fakelos i arxeio
	foreach ($item in $currentdir)
	{
		if (($item.Attributes -eq "Directory") -or ($item.Attributes -eq "Readonly,Directory"))
		{
			$dircount++
		}

		if($item.Attributes -eq "Archive")
		{
			$filescount++
		}
	}
	Return $filescount
}

Function checking($ans, $spath)
{ 
    $limit = 1000
	if ($ans -lt $limit)
	{
		$dirs = Get-ChildItem $spath
		foreach ($item in $dirs)
		   {
				if (($item.Attributes -eq "Directory") -or ($item.Attributes -eq "Readonly,Directory"))
				{
					$ans = countfds($item.Fullname)
					checking $ans $item.Fullname
				}
			}
		$paths = $spath.split("\")
		$paths[0] = "/cygdrive/c"
		$newpath = $paths -join "/"
		$a = "/* "
		$newpath = $newpath + $a

		$src = $newpath
		$command = $tool + $src + $dest
		#start-job $command
		invoke-expression "$tool $src $dest"

     }

	if (($ans -gt $limit) -or ($ans -eq $limit))
	{
        $paths = $spath.split("\")
		$paths[0] = "/cygdrive/c"
		$newpath = $paths -join "/"
		$a = "/* "
		$newpath = $newpath + $a

		$src = $newpath
		$command = $tool + $src + $dest
		#start-job $command
		invoke-expression "$tool $src $dest"

		$dirs = Get-ChildItem $spath

		#Kai gia kathe ena subfolder psaxnei na dei an o ipofakelos autos exei pano apo $limit files
		foreach ($item in $dirs)
		{
			if (($item.Attributes -eq "Directory") -or ($item.Attributes -eq "Readonly,Directory"))
				{
					$ans = countfds($item.Fullname)
					checking $ans $item.Fullname
			}
		}

	}
}

#Arxikes parametroi
$tool = "C:\rsync_project\rsync\rsync.exe --log-file='/cygdrive/c/testme/rsync.log' -R -d --exclude='*/' -av -P "
$srcpath = "C:\rsync_project"
$dest = "/cygdrive/c/testme"

#Arxika check sto src folder
$ans = countfds($srcpath)
checking $ans $srcpath