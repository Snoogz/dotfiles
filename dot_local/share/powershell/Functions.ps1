function which
{
	param($bin) Get-Command $bin -Force
}

function ll
{
	Get-ChildItem -Path $args -Force | Format-Table -AutoSize
}

function la
{
	Get-ChildItem -Path $args -Force -Hidden | Format-Table -AutoSize
}

function touch
{
	New-Item -ItemType File -Name $args[0] -Force
}

function mkcd
{
	param($dir) mkdir $dir -Force; Set-Location $dir
}

function Set-LocationButBetter
{
	param (
		[Parameter(
			ValueFromPipeline,
			ValueFromPipelineByPropertyName
		)]
		$Path
	)

	process
	{
		if($MyInvocation.BoundParameters.Count -eq 0)
		{
			$Path = $MyInvocation.InvocationName
		}
		# If this contains 3 or more period, that means move up additional levels.
		if($Path -match '^\.{2,}$')
		{
			$depth = $Path.Length
			$path = Get-Location
			# Start at 1 to treat the initial '..' as 1 parent.
			for ($i = 1; $i -lt $depth; $i++)
			{
				$path = (Split-Path $path -Parent)
			}
		}
		if ($Path -eq '-')
		{
			Pop-location
		} else
		{
			if ([System.IO.File]::Exists($Path))
			{
				Push-Location (Split-Path $Path -Parent)
			} else
			{
				Push-Location $Path
			}
		}
	}
}

Remove-Item alias:cd
Set-Alias -Name cd -Value Set-LocationButBetter
Set-Alias -Name .. -Value Set-LocationButBetter
Set-Alias -Name ... -Value Set-LocationButBetter

