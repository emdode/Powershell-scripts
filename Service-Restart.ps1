#MaDr script

param ($service)

$statusService = Get-Service -Name $service

if ($statusService.Status -ne "Running") {
    Stop-Service $service -Force
}
else {
    Start-Service $service
}

Write-output "$((Get-service -name $service).DisplayName) - Status $((Get-service -name $service).Status)"
