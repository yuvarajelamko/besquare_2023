*** Settings ***
Documentation  Check multiplier contract parameter
Library  SeleniumLibrary
Suite Teardown  Close All Browsers

*** Variables ***
${MyEmail}          yuvaraj@besquare.com.my
${MySecret}         testpassword
${BaseURL}          https://app.deriv.com
${duration}         2
${stake}           10
${barrier}          -0.2

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
    Wait Until Page Contains Element    dropdown-display    10
    Click Element   dropdown-display
    Wait Until Element Is Visible    //*[@id='real']
    Click Element   //*[@id='demo']
    Wait Until Element Is Visible    //*[contains(text(),'demo') and @class='dc-text demo-account-card__title' ]
    Wait Until Element Is Visible    //*[@class="dc-btn dc-btn--primary"][1]   10
    Click Element    //*[@class="dc-btn dc-btn--primary"][1]

Select Underlying
    Wait Until Element Is Visible    //*[@class="ic-icon cq-symbol-dropdown"]    20
    Click Element    //*[@class="ic-icon cq-symbol-dropdown"] 
    Wait Until Element Is Visible   //*[@class="sc-dialog cq-menu-dropdown cq-menu-dropdown-enter-done"]
    Wait Until Element Is Visible   //*[@class="sc-dialog cq-menu-dropdown cq-menu-dropdown-enter-done"]
    Wait Until Element Is Visible    //*[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]   10
    Wait Until Element Is Visible   //*[@class="sc-mcd__filter__subgroups-item sc-mcd__filter__item--active sc-mcd__filter__item--selected" and contains(text(),'Synthetics')]    10
    Click Element     //*[@class="sc-mcd__filter__subgroups-item sc-mcd__filter__item--active sc-mcd__filter__item--selected" and contains(text(),'Synthetics')]
    Wait Until Element Is Visible    //*[@class="sc-mcd__item sc-mcd__item--R_50 "]
    Click Element    //*[@class="sc-mcd__item sc-mcd__item--R_50 "]

Select Contract Type
    Wait Until Element Is Visible    //*[@data-testid="dt_contract_dropdown"]   10
    Click Element    //*[@data-testid="dt_contract_dropdown"]
    Wait Until Element Is Visible   //*[@id="dt_contract_multiplier_item"]
    Click Element    //*[@id="dt_contract_multiplier_item"]

Select Duration
    Wait Until Element Is Visible    //*[@id="dc_duration_toggle_item"]
    Click Element    //*[@id="dc_duration_toggle_item"]
    Wait Until Element Is Visible    //*[@class='dc-dropdown__display dc-dropdown__display--duration dc-dropdown__display--no-border']
    Wait Until Element Is Visible    //*[@class="dc-input__field"]
    Clear Input Field    //*[@class="dc-input__field"]
    Input Text   //*[@class="dc-input__field"]   ${duration}

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

Verify Error Message
    Wait Until Element Is Visible    //*[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]
    Wait Until Element Is Visible    //*[@class="dc-text"and contains(text(),'Contracts more than 24 hours in duration would need an absolute barrier.')]
    
*** Test Cases ***
Check multiplier contract parameter
    Login
    Select Underlying   
    Select Contract Type
    Select Duration
    Set Barrier
    Set Stake    
    Verify Error Message


    
