# Specify domain information
$domainName = "yourdomain.com"
$domainAdmin = "Administrator"
$domainPassword = ConvertTo-SecureString "YourPasswordHere" -AsPlainText -Force

# Promote server to the first domain controller in a new forest
Install-ADDSForest `
    -DomainName $domainName `
    -DomainMode "Win2016" `
    -ForestMode "Win2016" `
    -CreateDnsDelegation:$false `
    -Credential (New-Object System.Management.Automation.PSCredential ($domainAdmin, $domainPassword)) `
    -DatabasePath "C:\Windows\NTDS" `
    -LogPath "C:\Windows\Logs\ADDS" `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force:$true
