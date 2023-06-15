*** Settings ***
Library      SeleniumLibrary

*** Variables ***

${MyEmail}          myemail
${MySecret}			mypassword
${BaseURL}          https://app.deriv.com
${Read}             //*[@name='read']//parent::label
${Trade}            //*[@name='trade']//parent::label
${Payments}         //*[@name='payments']//parent::label
${TradingInfo}      //*[@name='trading_information']//parent::label
${Admin}            //*[@name='admin']//parent::label
${TokenInput}       //*[@class="dc-input__field"]

${CopyButton}       //*[@class="da-api-token__table-cell-row"]//*[@data-testid="dt_copy_token_icon"]
${ConfirmButton}    //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]
${DeleteConfirmation}   //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-dialog__button"]

${TestAPIURL}            https://api.deriv.com/api-explorer#authorize
${TestAPIInput}          //*[@id="playground-request"]
${TestAPIConfirmation}   //*[@class="c-hZhDRo c-hZhDRo-dVVGEb-size-medium c-hZhDRo-iSclJx-color-primary"]

${APIMenuLink}           https://app.deriv.com/account/api-token

${Lastused_date}         //tr[@class="da-api-token__table-cell-row"]//self::tr//span[@class="dc-text"]//following::span

*** Keywords ***

Clear Input Field
    [Arguments]   @{inputfield}
    Press Keys   ${inputfield}   CTRL+a+BACKSPACE

Paste API Field
    [Arguments]   @{inputfield}
    Press Keys   ${inputfield}   {"authorize":"
    Press Keys   ${inputfield}    CTRL+v 
    Press Keys   ${inputfield}   "}

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


        

    
    