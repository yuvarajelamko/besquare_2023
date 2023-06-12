*** Settings ***
Library      SeleniumLibrary

*** Variables ***

${MyEmail}          yuvaraj@besquare.com.my
${MySecret}			Yuva@2796
${BaseURL}          https://app.deriv.com
${Read}             //*[@name='read']//parent::label
${Trade}            //*[@name='trade']//parent::label
${Payments}         //*[@name='payments']//parent::label
${TradingInfo}      //*[@name='trading_information']//parent::label
${Admin}            //*[@name='admin']//parent::label
${TokenInput}       //*[@class="dc-input__field"]
${ConfirmButton}    //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]
${DeleteConfirmation}   //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button"]

*** Keywords ***

Clear Input Field
    [Arguments]   @{inputfield}
    Press Keys   ${inputfield}   CTRL+a+BACKSPACE
Login
    Open Browser   ${BaseURL}     chrome
    Maximize Browser Window
    Wait Until Page Contains Element    dt_login_button    10
    Click Element   dt_login_button
    Wait Until Page Contains Element    txtEmail     10
    Input Text   txtEmail   ${MyEmail}
    Input Password   txtPass   ${MySecret}     
    Click Element    //button[@name="login"]
    
Navigate to API page
    Wait Until Page Contains Element    dropdown-display    10
    Click Element   dropdown-display
    Wait Until Page Contains Element    //*[@href="/account/personal-details"]    10
    Click Element    //*[@href="/account/personal-details"]  
    Wait Until Page Contains Element    //*[@href="/account/api-token"]   10
    Click Element   //*[@href="/account/api-token"]

Select Scopes
    Wait Until Element Is Visible   ${Read} 
    Click Element   ${Read}
    Click Element   ${Trade}


        

    
    