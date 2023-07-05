# MaDr
# Check & clean C:\Windows.old directory

#Check if C:\Windows.old exist:
if (Test-Path C:\Windows.old) {
    $path = 'True'
    Write-Host 'Directory exist'
}
else {
    $path = 'False'
    Write-Host "Directory DOESN'T exits!"
}

#Check if Desktop experiences are installed
if (Test-Path C:\Windows\System32\cleanmgr.exe) {
    $cleanmgr = 'True'
    Write-Host "Desktop experiences are installed"
}
else {
    $cleanmgr = 'False'
    Write-Host "Desktop experiences are NOT installed"
}

#install Desktop experience
if ($cleanmgr -eq 'False') {
    Install-WindowsFeature DesktopExperience
}
do {
    Start-Sleep -Seconds 10
} until ($cleanmgr -eq 'True')

Start-Process cleanmgr.exe
