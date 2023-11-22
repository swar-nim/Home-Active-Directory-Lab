#Installing the Domain Controller


1. Use SCconfig 
 - to change the hostname
 - Use SCconfig to change network settings to have a static IP 
 - Change the preferred DNS server address to tha same IP address (or the loopback address)

2. Install the AD-DS using powershell

... 
   
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools   
   
...

3. Promote the server to DC 
...

- Import-Module ADDSDeployment
- Install-ADDSForest

...

#Once the DC installation is completed, the DNS server address will need to be reset to the machine's current static ipv4 aaddress

4. Changing the DNSServerAddress using Powershell

- GetNetIPAddress #This will display the current working interface index 

- Get-DnsClientServerAddress #This displays the interface index of the dns server

- Set-DnsClientServerAddress -InterfaceIndex [ ] -ServerAddresses [ ]

#The above command will change the current DNS Server Address to the specified address (replace [] with whatever the current interface index and the required DNS Server's IP Address is)

