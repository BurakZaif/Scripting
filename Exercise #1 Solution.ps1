$OU = "CN=Users,DC=corporate,DC=com"

$destinationFolder = "C:\Users\bzaifoglu\Desktop"
$destinationFilePath = Join-Path -Path $destinationFolder -ChildPath "UserDetails.csv"

New-Item -Path $destinationFilePath -ItemType File -Force

try{
    $userList = Get-ADUser -Filter * -SearchBase $OU -Properties Name, Mail, SamAccountName, Enabled -ErrorAction Stop
    $userList | Select-Object Name, Mail, SamAccountName, Enabled | Out-File -FilePath $destinationFilePath

}
catch{
    Write-Output "OU do not exists" | Out-File -FilePath $destinationFilePath
}







