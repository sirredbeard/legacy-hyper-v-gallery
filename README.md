# custom quick gallery for hyper-v

## distros

q4os

## installing gallery

### tl;dr: open powershell as admin and run

```
$newValue = New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\" -Name 'HereString' -PropertyType MultiString -Value @"
https://raw.githubusercontent.com/sirredbeard/hyper-v-gallery/master/gallery.json
"@

$newValue.multistring
```

### use powershell script

1. download add_gallery.ps1
1. if you have not done so already, enable powershell scripts by opening powershell as admin and running: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` (answer yes)
1. then cd to add_gallery.ps1 and run it: `.\add_gallery.ps1`