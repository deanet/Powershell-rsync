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


	#Emfanizei tous metrites fakelon kai arxeion
    #Write-Host --------- $dir ---------
	#Write-Host Directories found: $dircount
	#Write-Host Files found : $filescount

	Return $filescount
}

Function checking($ans, $path)
{
	if ($ans -lt 1000)
	{
	   Write-Host Rsyncing the $path
	}
	
	if ($ans -gt 1000)
	{
	   $dirs = Get-ChildItem $path
	   foreach ($item in $dirs)
	   {
	   		$ans = countfds($item.Fullname)
	   		checking $ans $item.Fullname
	   }
	}
}

Function Synchronize($dir)
{
 	$temp = Get-Item $dir
	$dirpaths = $temp.GetDirectories()
	
	foreach ($item in $dirpaths)
	{
	 	Write-Host Rsyncing $item.Fullname
	}
}