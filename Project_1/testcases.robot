*** Settings ***
Documentation  Test Cases for Project 1
Library      SeleniumLibrary
Resource     resources.robot

*** Test Cases ***

# Test case 1.1
Check valid token name (alphanumeric) and scope selection
    Login
    Navigate to API page
    Select Scopes
    Wait Until Element Is Visible    ${TokenInput}
    Input Text    ${TokenInput}   MyAPI24  
    Wait Until Element Is Visible   ${ConfirmButton}  
    Click Element   ${ConfirmButton}   


# Test case 1.2
Check valid token name (numeric) and scope selection
    Select Scopes
    Wait Until Element Is Visible    ${TokenInput}
    Input Text    ${TokenInput}   2796  
    Wait Until Element Is Visible   ${ConfirmButton}  
    Click Element   ${ConfirmButton}  


# Test case 2.1
Check valid token name (string) and scope selection
    Select Scopes
    Wait Until Element Is Visible    ${TokenInput}
    Input Text    ${TokenInput}   MyAPI  
    Wait Until Element Is Visible   ${ConfirmButton}  
    Click Element   ${ConfirmButton}  


# Test case 2.2
Check invalid token name (less than 2 characters)
    Select Scopes
    Input Text    ${TokenInput}   a  
    Wait Until Element Is Visible   //*[contains( text(),'Length of token name must be between 2 and 32 characters.')]   


# Test case 2.3
Check invalid token name (more than 32 characters)
    Clear Input Field    ${TokenInput}
    Input Text    ${TokenInput}   thisisaverylongstringwhichisusedtocarryouthistest 
    Wait Until Element Is Visible   //*[contains( text(),'Maximum 32 characters.')] 

# Test case 2.4
Check invalid token name (contains special characters)
    Clear Input Field    ${TokenInput}
    Input Text    ${TokenInput}   test@  
    Wait Until Element Is Visible   //*[contains( text(),'Only letters, numbers, and underscores are allowed.')]  

# Test case 2.5
Check invalid token name (empty string)
    Clear Input Field    ${TokenInput}
    Wait Until Element Is Visible    ${TokenInput}    
    Wait Until Element Is Visible   //*[contains( text(),'Please enter a token name.')]  

# Test case 3
Check if can create api token with duplicate name
    Select Scopes   
    Wait Until Element Is Visible   //*[contains( text(),'Please enter a token name.')] 
    Wait Until Element Is Visible    ${TokenInput}
    Input Text    ${TokenInput}   MyAPI24  
    Wait Until Element Is Visible   ${ConfirmButton}  
    Click Element   ${ConfirmButton}  

# Test case 4
Delete created API
    Wait Until Element Is Visible    //*[@data-testid="dt_token_delete_icon"][1]
    Click Element  //*[@data-testid="dt_token_delete_icon"][1]
    Wait Until Element Is Visible   ${DeleteConfirmation} 
    Click Element   ${DeleteConfirmation} 
