$ErrorActionPreference = "Stop"
$VerbosePreference = "Continue"

Write-Verbose "Checking if you have Administrator rights."

If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this script.`nPlease re-run this script as an Administrator."
    Break
}
Else
{
    Write-Verbose "You have Administrator rights."
}

Try
{
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\" -Name "GalleryLocations"
    Write-Verbose "Removed custom GalleryLocations."
}
Catch
{
    Write-Verbose "Unsuccessful at removing custom GalleryLocations."
}