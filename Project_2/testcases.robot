*** Settings ***
Documentation  Test Cases for Project 2
Library      SeleniumLibrary
Resource     resources.robot

*** Test Cases ***


# TC01 : Verify Security and privacy policy hyperlink redirects to the policy PDF
Verify security and privacy policy hyperlink works
    Login
    Navigate to Account Deletion page
    Click Security and Privacy Policy
    Switch Window        url=https://deriv.com/tnc/security-and-privacy.pdf
    Location Should Be   url=https://deriv.com/tnc/security-and-privacy.pdf
    Close Browser

# TC02 : Verify account can be deleted with valid selection of reasons and input in text boxes
Verify account can be deleted
    Login
    Navigate to Account Deletion page
    Click Close my Account
    Wait Until Element Is Visible    ${OtherTradingInput}
    Select 3 Reasons for Account Deletion
    Wait Until Element Is Visible    ${CheckboxDisabled}
    Input Text    ${OtherTradingInput}   Im using this platform
    Input Text    ${ImprovementsInput}   No Improvements from me   
    Wait Until Element Is Visible   ${ContinueButton}  
    Click Element   ${ContinueButton}  
    Wait Until Element Is Visible   ${ConfirmationModal}  
    Wait Until Element Is Visible   ${CloseButton}  
    Click Element   ${CloseButton}
    ReLogin
    Wait Until Element Is Visible  //*[@class="reactivate-title"]
    Click Element   //*[@id="btnGrant"] 
    Wait Until Page Contains Element    //*[@href="/account/personal-details"]    10
    Close Browser

# TCO3 : Verify account can’t be deleted by selecting no reasons
Verify account can’t be deleted by selecting no reasons
    Login
    Navigate to Account Deletion page
    Click Close my Account
    Wait Until Element Is Visible    ${FinancialOption}
    Click Element   ${FinancialOption}
    Click Element   ${FinancialOption}
    Wait Until Element Is Visible    ${NoReason}
    Wait Until Element Is Visible    ${ContinueDisabled}
    Close Browser

# TC04 : Verify account can’t be deleted by selecting more than three reasons
Verify account can’t be deleted by selecting more than three reasons
    Login
    Navigate to Account Deletion page
    Click Close my Account
    Wait Until Element Is Visible    ${FinancialOption}
    Select 3 Reasons for Account Deletion
    Wait Until Element Is Visible    ${CheckboxDisabled}
    Close Browser


# TCO5 : Verify account can’t be deleted by exceeding character limit in text boxes
Verify account can’t be deleted by exceeding character limit in text boxes
    Login
    Navigate to Account Deletion page
    Click Close my Account
    Wait Until Element Is Visible    ${FinancialOption}
    Select 3 Reasons for Account Deletion
    Wait Until Element Is Visible    ${CheckboxDisabled}
    Input Text    ${OtherTradingInput}   ${LongText}
    Wait Until Element Is Visible   ${ZeroCharactersLeft}
    Close Browser

# TC06 : Verify account can’t be deleted by entering symbols in text boxes
Verify account can’t be deleted by entering symbols in text boxes
    Navigate to Account Deletion page
    Click Close my Account
    Wait Until Element Is Visible    ${FinancialOption}
    Select 3 Reasons for Account Deletion
    Wait Until Element Is Visible    ${CheckboxDisabled}
    Input Text    ${OtherTradingInput}   Test@
    Wait Until Element Is Visible   ${InputContainsSymbol}
    Close Browser

# TC07 : Verify character counter works when text is inputted
Verify character counter works when text is inputted
    Navigate to Account Deletion page
    Click Close my Account
    Wait Until Element Is Visible    ${FinancialOption}
    Select 3 Reasons for Account Deletion
    Wait Until Element Is Visible    ${CheckboxDisabled}
    Input Text    ${OtherTradingInput}   Test
    Wait Until Element Is Visible   //*[@class="dc-text closing-account-reasons__hint" and contains(text(), 'Remaining characters: 106')]
    Close Browser

# TC08 : Verify account can be deleted when both text boxes are left empty
Verify account can be deleted when both text boxes are left empty
    Login
    Navigate to Account Deletion page
    Click Close my Account
    Wait Until Element Is Visible    ${OtherTradingInput}
    Select 3 Reasons for Account Deletion
    Wait Until Element Is Visible    ${CheckboxDisabled}  
    Wait Until Element Is Visible   ${ContinueButton}  
    Click Element   ${ContinueButton}  
    Wait Until Element Is Visible   ${ConfirmationModal}  
    Wait Until Element Is Visible   ${CloseButton}  
    Click Element   ${CloseButton}
    ReLogin
    Wait Until Element Is Visible  //*[@class="reactivate-title"]
    Click Element   //*[@id="btnGrant"]  
    Wait Until Page Contains Element    //*[@href="/account/personal-details"]    10
    Close Browser

# TC09 : Verify both text fields add up and matches the character count in the character counter
Verify both text fields add up and matches the character count in the character counter
    Login
    Navigate to Account Deletion page
    Click Close my Account
    Wait Until Element Is Visible    ${OtherTradingInput}
    Select 3 Reasons for Account Deletion
    Wait Until Element Is Visible    ${CheckboxDisabled}
    Input Text    ${OtherTradingInput}   Test
    Input Text    ${ImprovementsInput}   Test  
    Wait Until Element Is Visible   //*[@class="dc-text closing-account-reasons__hint" and contains(text(), 'Remaining characters: 102')]
    Close Browser

# TC10 : Verify you can go back from the Account Deletion Confirmation Modal
Verify you can go back from the Account Deletion Confirmation Modal
    Login
    Navigate to Account Deletion page
    Click Close my Account
    Wait Until Element Is Visible    ${OtherTradingInput}
    Select 3 Reasons for Account Deletion
    Wait Until Element Is Visible    ${CheckboxDisabled}
    Input Text    ${OtherTradingInput}   Im using this platform
    Input Text    ${ImprovementsInput}   No Improvements from me   
    Wait Until Element Is Visible   ${ContinueButton}  
    Click Element   ${ContinueButton}  
    Wait Until Element Is Visible   ${ConfirmationModal}
    Click Element    ${GoBackButton} 
    Wait Until Element Is Visible   ${ContinueButton}
    Close Browser    
