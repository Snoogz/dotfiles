function Initialize-Profile
{
	Write-Host "Initializing profile..."

	# Chocolatey prompt
	$ChocolateyProfile = "$env:CHOCOLATEYINSTALL\helpers\chocolateyProfile.psm1"
	$modules = @{
		"$ChocolateyProfile" = @{
			if = $(Test-Path($ChocolateyProfile))
		}
	}

	foreach($module in $modules.Keys)
	{
		if($modules.Item($module).ContainsKey("if") -and -not $modules.Item($module).Item("if"))
		{
			continue
		}
		try
		{
			Import-Module $module
		} catch
		{
			Write-Host "Failed to import: $module. $_"
		}
	}
}
