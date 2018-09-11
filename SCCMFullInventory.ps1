Write-Host "Perform full inventory for which SCCM inventory component?"
Write-Host "1.  Hardware Inventory"
Write-Host "2.  Software Inventory"
Write-Host "3.  Discovery Inventory"
Write-Host "4.  File Collection"
Write-Host "5.  IDMIF Collection"
Write-Host " "
$Answer = Read-Host -Prompt "Enter your selection"

If ($Answer -eq 1) {$strAction = “{00000000-0000-0000-0000-000000000001}”}
If ($Answer -eq 2) {$strAction = “{00000000-0000-0000-0000-000000000002}”}
If ($Answer -eq 3) {$strAction = “{00000000-0000-0000-0000-000000000003}”}
If ($Answer -eq 4) {$strAction = “{00000000-0000-0000-0000-000000000010}”}
If ($Answer -eq 5) {$strAction = “{00000000-0000-0000-0000-000000000011}”}

If (!$strAction) {


} Else {
    Get-WmiObject -Namespace “root\ccm\invagt” -Class InventoryActionStatus | where {$_.InventoryActionID -eq “$strAction”} | Remove-WmiObject

    try {
    Invoke-WmiMethod -ComputerName $env:computername -Namespace root\ccm -Class SMS_Client -Name TriggerSchedule -ArgumentList $strAction -ErrorAction Stop | Out-Null
    }
    catch {
    write-host “$env:computername`: $_” -ForegroundColor Red
    }
} 
