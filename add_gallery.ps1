If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`

    [Security.Principal.WindowsBuiltInRole] "Administrator"))

{

    Write-Warning "You do not have Administrator rights to run this script.`nPlease re-run this script as an Administrator."

    Break

}

$newValue = New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\" -Name 'GalleryLocations' -PropertyType MultiString -Value @"
https://raw.githubusercontent.com/sirredbeard/hyper-v-gallery/master/gallery.json
"@

$newValue.multistring