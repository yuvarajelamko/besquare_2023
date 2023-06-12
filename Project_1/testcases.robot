*** Settings ***
Documentation  Verify API token can be created with valid token name and scope selection
Library      SeleniumLibrary
Resource     template.robot

*** Test Cases ***

# Test case 1
Check valid token name and scope selection
    Login
    Navigate to API page
    Select Scopes
    Wait Until Element Is Visible    ${TokenInput}
    Input Text    ${TokenInput}   MyAPI  
    Click Element   ${ConfirmButton}  


# Test case 2
Check invalid token name (less than 2 characters)
    Select Scopes
    Input Text    ${TokenInput}   a  
    Wait Until Element Is Visible   //*[contains( text(),'Length of token name must be between 2 and 32 characters.')]   


# Test case 3
Check invalid token name (more than 32 characters)
    Clear Input Field    ${TokenInput}
    Input Text    ${TokenInput}   thisisaverylongstringwhichisusedtocarryouthistest 
    Wait Until Element Is Visible   //*[contains( text(),'Maximum 32 characters.')] 

# Test case 4
Check invalid token name (contains special characters)
    Clear Input Field    ${TokenInput}
    Input Text    ${TokenInput}   test@  
    Wait Until Element Is Visible   //*[contains( text(),'Only letters, numbers, and underscores are allowed.')]  

# Test case 5
Check invalid token name (empty string)
    Clear Input Field    ${TokenInput}
    Wait Until Element Is Visible    ${TokenInput}    
    Wait Until Element Is Visible   //*[contains( text(),'Please enter a token name.')]  
