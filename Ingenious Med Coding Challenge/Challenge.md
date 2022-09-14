Create a new iPhone / iPad application to create users. The application can be written in Objective C or Swift or a mixture of both Objective C and Swift.

The application consists of a single UIView used to 'Create User' and the view consists of 3-UITextFields and 1-UIButton 

UITextField1 should accept username
UITextField2 should accept a password
UITextField3  should ask you to retype the password
(Please add appropriate placeholder text to inform the user of what each text field is)

Button should have the title 'Create User'

When tapping on button 'Create User' you should verify if the username and password meet the following criteria
    - Username should be a valid email format (should contain '@' symbol & should end with '.com'  domain)
    - Password should contain at-least 1 Uppercase character
    - Password should contain at-least 1 Special Character
    - Password should contain at-least 2 numbers 
    - Password should be at-least 6 characters long (min - 6 characters, max - no limit)
    - Password entered in textfield2 and password entered in textfield3 should be an exact match 

Please provide appropriate error / success messages in the form of an UIAlertView to inform the user

Bonus 
    - Writing appropriate Unit and UITest to test and verify the above logic
