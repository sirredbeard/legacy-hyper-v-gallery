$ErrorActionPreference = "Stop"
$VerbosePreference = "Continue"

Write-Verbose "Checking if you have Administrator rights."

If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this script.`nPlease re-run this script as an Administrator."
    Break
}

Write-Verbose "Removing old GalleryLocations, if they exist."

Try
{
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\" -Name "GalleryLocations"
    Write-Verbose "Removed custom GalleryLocations."
}
Catch
{
    Write-Verbose "No old GalleryLocations found."
}

Write-Verbose "Writing new GalleryLocations."

$newValue = New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\"  `
    -Name 'GalleryLocations' -PropertyType MultiString -Value (
    'https://raw.githubusercontent.com/sirredbeard/hyper-v-gallery/master/gallery.json',
    'https://go.microsoft.com/fwlink/?linkid=851584')
$newValue.multistring

$newValue.multistring

Write-Verbose "New GalleryLocations written successfully."