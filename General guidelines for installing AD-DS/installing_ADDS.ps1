# Check if Active Directory Domain Services feature is already installed
if (Get-WindowsFeature -Name AD-Domain-Services -ErrorAction SilentlyContinue) {
    Write-Host "Active Directory Domain Services is already installed."
} else {
    # Install Active Directory Domain Services feature
    Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -Verbose

    if ($?) {
        Write-Host "Active Directory Domain Services has been successfully installed."
    } else {
        Write-Host "Failed to install Active Directory Domain Services. Check for errors."
    }
}