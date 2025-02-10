$global:profile_initialized = $false

$DataHome = if ($env:XDG_DATA_DATA)
{
	$env:XDG_DATA_HOME
} else
{
	[IO.Path]::Combine($HOME, ".local", "share")
}
$ConfigHome = if ($env:XDG_CONFIG_HOME)
{
	$env:XDG_CONFIG_HOME
} else
{
	[IO.Path]::Combine($HOME, ".config")
}

# Load functions
@(
	"Functions.ps1",
	"Initialize-Profile.ps1"
) | ForEach-Object {
	$path = "$HOME/Documents/PowerShell/Scripts/$_"
	if (Test-Path $path -ErrorAction SilentlyContinue)
	{
		. (Convert-Path $path)
	}
}

# Starship config
