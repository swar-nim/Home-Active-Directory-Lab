New Domain Controller Setup
Purpose:

This PowerShell script sets up a new domain on the server and promotes it as the first domain controller in that domain.
Prerequisites:

    A Windows Server with administrative privileges.
    Basic understanding of domain setup and PowerShell.

Usage Instructions:

    Open PowerShell with administrative privileges.
    Copy and paste the script into the PowerShell console or save it as a .ps1 file.
    Execute the script.

Script Overview:

    Domain Information:
        Modify the $domainName variable to set the desired domain name.
        Set $domainAdmin to the username of a domain admin account.
        Replace "YourPasswordHere" in $domainPassword with the password for the domain admin account.

    Promotion Process:
        Install-ADDSForest cmdlet creates a new domain and promotes the server as the first domain controller.
            -DomainName: Specifies the name for the new domain.
            -DomainMode & -ForestMode: Set the domain and forest functional level.
            -CreateDnsDelegation: Determines whether to create a DNS delegation.
            -Credential: Provides admin credentials for the setup.
            -DatabasePath, -LogPath, -SysvolPath: Define storage paths for different components.
            -Force: Forces the setup process.

Steps:

    Domain Setup:
        The script starts by setting up a new domain.
        It specifies the domain name using $domainName.

    Domain Controller Promotion:
        The script promotes the server to be the first domain controller in the newly created domain.
        It uses the provided admin credentials for this setup.

    Completion:
        The script finalizes the process by setting up necessary folders and components for the new domain.

Notes:

    Replace placeholders like yourdomain.com and YourPasswordHere with actual domain information.
    Ensure the provided domain admin credentials have sufficient privileges.
    Run the script with administrative privileges.