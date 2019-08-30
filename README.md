# custom quick create gallery for hyper-v

## background

see my [blog post](https://boxofcables.dev/hyper-v-gallery/)

## distros

* q4os trinity
* oracle linux 8
* solus budgie
* arch
* ghostbsd 19.04
* devuan ascii
* fedora silverblue 30
* pop_os!
* scientific linux 7

## installing the gallery

### tl;dr: open powershell as admin and run

```
$newValue = New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\"  `
    -Name 'GalleryLocations' -PropertyType MultiString -Value (
    'https://raw.githubusercontent.com/sirredbeard/hyper-v-gallery/master/gallery.json',
    'https://go.microsoft.com/fwlink/?linkid=851584')
$newValue.multistring
```

This adds the custom json from this repo alongside the existing Microsoft json in place.

### use included powershell script

1. download [add_gallery.ps1](https://raw.githubusercontent.com/sirredbeard/hyper-v-gallery/master/add_gallery.ps1)
1. if you have not done so already, enable powershell scripts by opening powershell as admin and running: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` (answer yes)
1. make sure you are admin then cd to the folder with add_gallery.ps1 and run it: `.\add_gallery.ps1`

## removing gallery

### use powershell script

1. download [rm_gallery.ps1](https://github.com/sirredbeard/hyper-v-gallery/blob/master/rm_gallery.ps1)
1. if you have not done so already, enable powershell scripts by opening powershell as admin and running: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser` (answer yes)
1. make sure you are admin then cd to the folder with rm_gallery.ps1 and run it: `.\add_gallery.ps1`

## notes

this project was inspired by the following:

- "[How to create a Custom Hyper-V Quick Create VM Gallery](https://techcommunity.microsoft.com/t5/ITOps-Talk-Blog/How-to-create-a-Custom-Hyper-V-Quick-Create-VM-Gallery/ba-p/781346)" by Thomas Maurer
- "[Create a custom virtual machine gallery](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/custom-gallery?WT.mc_id=itopstalk-blog-thmaure)" by Sarah Cooley
- "[Create your custom Quick Create VM gallery](https://techcommunity.microsoft.com/t5/Virtualization/Create-your-custom-Quick-Create-VM-gallery/ba-p/382388)" by Lars Iwer
