Active Directory Domain Services Installation Script
Purpose:

This PowerShell script automates the installation of Active Directory Domain Services (AD DS) on a Windows Server 2019 Core system.
It checks if the AD DS feature is already installed and installs it if it's not present.
Prerequisites:

    Windows Server 2019 Core system
    Administrative privileges for executing PowerShell scripts

Usage Instructions:

    Open PowerShell with administrative privileges.
    Copy and paste the script into the PowerShell console or save it as a .ps1 file.
    Execute the script.

Script Overview:

    Check for Existing Installation:
        Verifies if the AD DS feature is already installed on the system.
        Displays a message if AD DS is already installed.

    Installation Process:
        If AD DS is not installed, the script proceeds to install the AD DS feature using Install-WindowsFeature.
        Includes management tools with the -IncludeManagementTools parameter.

    Outcome Display:
        On successful installation, it displays a success message.
        If installation fails, it provides an error message.

Script Code:

powershell

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

Notes:

    This script assumes that PowerShell is being run with administrative privileges.
    Ensure the server has internet connectivity or access to the required installation sources for AD DS.
    Any errors encountered during installation will be displayed in the PowerShell console.