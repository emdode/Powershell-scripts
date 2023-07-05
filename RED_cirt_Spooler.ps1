#MaDr script
#RED CIRT Spooler

$printerspath = 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers'

#registry check
If (Test-Path $printerspath)
    {
        New-ItemProperty -Path $printerspath RegisterSpoolerRemoteRpcEndPoint -Type DWORD -Value 2 -Force > $null
    }
else
    {
        New-Item -Path $printerspath -Force > $null
        New-ItemProperty -Path $printerspath RegisterSpoolerRemoteRpcEndPoint -Type DWORD -Value 2 -Force > $null
    }
$r = Get-ItemProperty  -Path 'HKLM:\Software\Policies\Microsoft\Windows NT\Printers\'| select RegisterSpoolerRemoteRpcEndPoint

#service disabling
Stop-Service -Name Spooler -Force
$s = Get-Service spooler
while ($s.Status -ne 'Stopped')
    {
        Start-Sleep -Seconds 1
    }
Set-Service spooler -StartupType Disabled

#output script
$o = "$($s.DisplayName) - $($s.StartType) - $($s.Status) | Registry output: $($r.RegisterSpoolerRemoteRpcEndPoint)"
$o.ToString()
