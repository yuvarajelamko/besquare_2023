*** Settings ***
Library      SeleniumLibrary

*** Variables ***

${MyEmail}          myemail
${MySecret}			mypassword
${BaseURL}          https://app.deriv.com
${SecurityPolicy}        //*[@href="https://deriv.com/tnc/security-and-privacy.pdf"]
${CloseMyAccount}        //*[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]

${FinancialOption}       //*[@class="dc-checkbox closing-account-reasons__checkbox"]//span[@class="dc-text dc-checkbox__label" and contains(text(), 'I have other financial priorities.')]
${StopTradingOption}     //*[@class="dc-checkbox closing-account-reasons__checkbox"]//span[@class="dc-text dc-checkbox__label" and contains(text(), 'I want to stop myself from trading.')]
${InterestOption}        //*[@class="dc-checkbox closing-account-reasons__checkbox"]//span[@class="dc-text dc-checkbox__label" and contains(text(), 'I’m no longer interested in trading.')]
${PreferOtherOption}     //*[@class="dc-checkbox closing-account-reasons__checkbox"]//span[@class="dc-text dc-checkbox__label" and contains(text(), 'I prefer another trading website.')]

${OtherTradingInput}     //*[@name="other_trading_platforms"]
${ImprovementsInput}     //*[@name="do_to_improve"]

${ContinueButton}        //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large"] 
${ContinueDisabled}      //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large" and @disabled]  
${CloseButton}           //*[@class="account-closure-warning-modal"]//button[2]
${GoBackButton}          //*[@class="account-closure-warning-modal"]//button[1]


${ConfirmationModal}     //*[@class="account-closure-warning-modal"]
${ReactivationScreen}    //*[@class="reactivate-title"]

#Error Catching
${NoReason}    //*[contains(text(),'Please select at least one reason')]
${InputContainsSymbol}    //*[contains(text(),'Must be numbers, letters, and special characters')]
${CheckboxDisabled}   //*[@class="dc-checkbox__box dc-checkbox__box--disabled"]
${ZeroCharactersLeft}  //*[@class="dc-text closing-account-reasons__hint" and contains(text(), 'Remaining characters: 0')]

${LongText}   TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTe
   

*** Keywords ***

Login
    Open Browser   ${BaseURL}     chrome
    Maximize Browser Window
    Wait Until Page Contains Element    dt_login_button    10
    Click Element   dt_login_button
    Wait Until Page Contains Element    txtEmail     10
    Input Text   txtEmail   ${MyEmail}
    Input Password   txtPass   ${MySecret}     
    Click Element    //button[@name="login"]

ReLogin
    Sleep  12s
    Wait Until Element Is Enabled    dm-nav-login-button    20
    Click Element   dm-nav-login-button
    Wait Until Page Contains Element    txtEmail     10
    Input Text   txtEmail   ${MyEmail}
    Input Password   txtPass   ${MySecret}     
    Click Element    //button[@name="login"]
    
Click Security and Privacy Policy
    Wait Until Page Contains Element   ${SecurityPolicy}
    Click Element    ${SecurityPolicy}
    
Click Close my Account
    Wait Until Page Contains Element   ${CloseMyAccount} 
    Click Element    ${CloseMyAccount} 
Navigate to Account Deletion page
    Wait Until Page Contains Element    dropdown-display    10
    Click Element   dropdown-display
    Wait Until Page Contains Element    //*[@href="/account/personal-details"]    10
    Click Element    //*[@href="/account/personal-details"]  
    Wait Until Page Contains Element    //*[@href="/account/closing-account"]   10
    Click Element   //*[@href="/account/closing-account"] 

Select 3 Reasons for Account Deletion
    Wait Until Element Is Visible    ${FinancialOption}
    Click Element   ${FinancialOption}
    Click Element   ${StopTradingOption}
    Click Element   ${InterestOption}

Reactive
    Click Element   //*[@id="btnGrant"]
    Wait Until Page Contains Element    //*[@href="/account/personal-details"]    10

Reactivate
    ${IsElementVisible}=  Run Keyword And Return Status    Element Should Be Visible   ${ReactivationScreen}
    Run Keyword If    ${IsElementVisible}  Reactive