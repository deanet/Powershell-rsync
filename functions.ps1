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
    Write-Host --------- $dir ---------
	Write-Host Directories found: $dircount
	Write-Host Files found : $filescount

	if ($filescount -lt 1000)
	{
		Write-Host Einai ligotero apo 1000 kai etrexa gia rsync
		return 0
	}

	if (($filescount -gt 1000))
	{
	    Write-Host Einai megalitero apo 1000 kai thelei na ksanatreksei i countfds
		$currentdir = Get-ChildItem -Recurse | Select-Object -Property Fullname
		foreach ($item in $currentdir)
		{
		 		<#if ((($item.Fullname).Attributes -eq "Directory") -or (($item.Fullname).Attributes -eq "Readonly,Directory"))
				{
				   Write-Host "BIkkaaaa"
		  		   countfds($item.Fullname)
				}#>
				$item.Fullname
				countfds($item.Fullname)
		}
	}

}