#Installing the Domain Controller


1. Use SCconfig 
 - to change the hostname
 - Use SCconfig to change network settings to have a static IP 
 - Change the preferred DNS server address to tha same IP address (or the loopback address)

2. Install the AD-DS using powershell
... 
   shell
   
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools   
   
...