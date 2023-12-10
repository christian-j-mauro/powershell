do {
#get time from system
$hour = (Get-Date).Hour

#input for tech's name
Write-Host "Technician's name: "
$technician = Read-Host

#input for client's name
Write-Host "Client's name: "
$client = Read-Host

#input for ticket number
Write-Host "Ticket number: "
$ticket = Read-Host

#Logic for greeting
$greeting = "day"
if ($hour -lt 12) {
    $timeOfDay = "morning"

} elseif ($hour -gt 12 -and $hour -lt 16) {
    $timeOfDay = "afternoon"

} else {
    $timeOfDay = "evening"
}

Write-Host "Good $timeOfDay $technician! I have $client on the phone responding about #$ticket
Would you be able to take the call?"

Write-Host "Continue? 'enter for yes; n for no'"
$continue = Read-Host
} while($continue -ne "n")