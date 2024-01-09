# Set the distinguished name of the domain
$domainDN = "DC=example,DC=com"

# Create a new organizational unit named "Sales"
New-ADOrganizationalUnit -Name "Sales" -Path "OU=Sales,$domainDN"
