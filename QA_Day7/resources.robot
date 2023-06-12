*** Settings ***
Documentation  resources file
Library  SeleniumLibrary

*** Variables ***
${MyEmail}          myemail
${MySecret}			mypassword
${BaseURL}          https://app.deriv.com
${duration}         2
${payout}           15.50
${stake}            10
${barrier}          -0.2
${TradeType}        Forex
${TradeTypeSelection}  @class="sc-mcd__filter__subgroups-item sc-mcd__filter__item--active sc-mcd__filter__item--selected"
${ContractType}     //*[@id="dt_contract_high_low_item"]
${MarketType}       //*[@class="ic-frx ic-frxAUDUSD"]

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

Switch to virtual account
    Wait Until Page Contains Element    dropdown-display    10
    Click Element   dropdown-display
    Wait Until Element Is Visible    //*[@id='real']
    Click Element   //*[@id='demo']
    Wait Until Element Is Visible    //*[contains(text(),'demo') and @class='dc-text demo-account-card__title' ]

Enter Deriv Trader
    Wait Until Element Is Visible    //*[@class="dc-btn dc-btn--primary"][1]   10
    Click Element    //*[@class="dc-btn dc-btn--primary"][1]
    Sleep  10s

Select Underlying
    Wait Until Element Is Visible    //*[@class="ic-icon cq-symbol-dropdown"]    20
    Click Element    //*[@class="ic-icon cq-symbol-dropdown"] 
    Wait Until Element Is Visible   //*[@class="sc-dialog cq-menu-dropdown cq-menu-dropdown-enter-done"]
    Wait Until Element Is Visible   //*[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]   10
    Wait Until Element Is Visible   //*[@class="sc-mcd__filter__subgroups-item sc-mcd__filter__item--active sc-mcd__filter__item--selected" and contains(text(),'Synthetics')]    10
    Click Element     //*['${TradeTypeSelection}' and contains(text(),'${TradeType}')]
    Wait Until Element Is Visible    ${MarketType}
    Click Element    ${MarketType}

Select Contract Type
    Wait Until Element Is Visible    //*[@data-testid="dt_contract_dropdown"]   10
    Click Element    //*[@data-testid="dt_contract_dropdown"]
    Wait Until Element Is Visible   ${ContractType}
    Click Element    ${ContractType}

Select Duration
    Wait Until Element Is Visible    //*[@id="dc_duration_toggle_item"]
    Click Element    //*[@id="dc_duration_toggle_item"]
    Wait Until Element Is Visible    //*[@class='dc-dropdown__display dc-dropdown__display--duration dc-dropdown__display--no-border']
    Wait Until Element Is Visible    //*[@class="dc-input__field"]
    Clear Input Field    //*[@class="dc-input__field"]
    Input Text   //*[@class="dc-input__field"]   ${duration}   

Set Payout
    Wait Until Element Is Visible    //*[@id="dc_payout_toggle_item"]
    Click Element    //*[@id="dc_payout_toggle_item"]
    Wait Until Element Is Visible    //*[@id='dt_amount_input']
    Clear Input Field   //*[@id='dt_amount_input'] 
    Input Text    //*[@id='dt_amount_input']    ${payout}


Set Barrier
    Wait Until Element Is Visible   //*[@id="dt_barrier_1_input"]
    Clear Input Field               //*[@id="dt_barrier_1_input"]
    Input Text    //*[@id="dt_barrier_1_input"]   ${barrier} 

Set Stake
    Wait Until Element Is Visible    //*[@id="dc_stake_toggle_item"]
    Click Element    //*[@id="dc_stake_toggle_item"]
    Wait Until Element Is Visible    //*[@id='dt_amount_input']
    Clear Input Field   //*[@id='dt_amount_input'] 
    Input Text    //*[@id='dt_amount_input']    ${stake}

Click Purchase Button
    Wait Until Element Is Visible    //*[@id='dt_purchase_put_button']
    Wait Until Element Is Visible   //*[@class="trade-container__price-info-currency"]
    Click Element    //*[@id='dt_purchase_put_button']
    Wait Until Page Contains Element    //*[@data-testid="dt_span" and contains(text(),'${payout}')]   30