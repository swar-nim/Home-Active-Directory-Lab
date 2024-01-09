# Define user attributes
$department = "Sales"                # Define the department for the user
$level = "Manager"                   # Define the level for the user
$firstName = "John"                  # Define the first name of the user
$lastName = "Doe"                    # Define the last name of the user
$email = "johndoe@example.com"       # Define the email address of the user
$phoneNumber = "123-456-7890"        # Define the phone number of the user
$office = "Office123"                # Define the office for the user
$streetAddress = "123 Main Street"   # Define the street address for the user
$city = "Anytown"                    # Define the city for the user
$state = "NY"                        # Define the state for the user
$postcode = "10001"                  # Define the postal code for the user
$country = "USA"                     # Define the country for the user

# Define user credentials
$username = "newuser"                # Define the username for the new user
$password = ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force  # Define the password for the new user

# Create a new user with specified attributes
New-ADUser -Name $username -GivenName $firstName -Surname $lastName -EmailAddress $email `
    -AccountPassword $password -Department $department -OtherAttributes @{
        title=$level
        telephoneNumber=$phoneNumber
        office=$office
        streetAddress=$streetAddress
        city=$city
        state=$state
        postalCode=$postcode
        country=$country
    } -Enabled $true -PassThru
