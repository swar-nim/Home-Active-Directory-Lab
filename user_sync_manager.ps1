# Define user information
$userList = @(
    @{
        Username = "user1"
        FirstName = "John"
        LastName = "Doe"
        Department = "Sales"
    },
    @{
        Username = "user2"
        FirstName = "Jane"
        LastName = "Smith"
        Department = "Marketing"
    }
    # Add more users as needed
)

# Iterate through the user list and create/update users in specified OUs or groups
foreach ($user in $userList) {
    # Check if the user exists; if not, create the user
    if (-not (Get-ADUser -Filter {SamAccountName -eq $user.Username})) {
        New-ADUser -SamAccountName $user.Username -GivenName $user.FirstName -Surname $user.LastName -Department $user.Department -Enabled $true -PassThru
    } else {
        # If the user exists, update their attributes (e.g., department)
        Set-ADUser -Identity $user.Username -Department $user.Department
    }

    # Add user to specific groups based on their department or other criteria
    switch ($user.Department) {
        "Sales" { Add-ADGroupMember -Identity "SalesGroup" -Members $user.Username -ErrorAction SilentlyContinue }
        "Marketing" { Add-ADGroupMember -Identity "MarketingGroup" -Members $user.Username -ErrorAction SilentlyContinue }
        # Add more cases for additional departments/groups
    }
}
