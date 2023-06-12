*** Settings ***
Documentation  single test for buy rise contract
Library  SeleniumLibrary
Suite Teardown  Close All Browsers

*** Variables ***
${MyEmail}          yuvaraj@besquare.com.my
${MySecret}			testpassword
${BaseURL}          https://app.deriv.com

*** Test Cases ***
login
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
    Wait Until Element Is Visible    //*[@class="dc-btn dc-btn--primary"][1]
    Click Element    //*[@class="dc-btn dc-btn--primary"][1]
    Wait Until Element Is Visible    //*[@class="ic-icon cq-symbol-dropdown"]    10
    Click Element    //*[@class="ic-icon cq-symbol-dropdown"] 
    Wait Until Element Is Visible   //*[@class="sc-dialog cq-menu-dropdown cq-menu-dropdown-enter-done"]
    Wait Until Element Is Visible    //*[@class="sc-mcd__filter__item sc-mcd__filter__item--selected"]   10
    Wait Until Element Is Visible   //*[@class="sc-mcd__filter__subgroups-item sc-mcd__filter__item--active sc-mcd__filter__item--selected" and contains(text(),'Synthetics')]    10
    Click Element     //*[@class="sc-mcd__filter__subgroups-item sc-mcd__filter__item--active sc-mcd__filter__item--selected" and contains(text(),'Synthetics')]
    Wait Until Element Is Visible    //*[@class="sc-mcd__item sc-mcd__item--1HZ10V "]
    Click Element    //*[@class="sc-mcd__item sc-mcd__item--1HZ10V "]
    Wait Until Element Is Visible    //*[@data-testid="dt_contract_dropdown"]   10
    Click Element    //*[@data-testid="dt_contract_dropdown"]
    Wait Until Element Is Visible   //*[@id="dt_contract_rise_fall_item"]
    Click Element    //*[@id="dt_contract_rise_fall_item"]
    Click Element    //*[@id="dc_t_toggle_item"]
    Wait Until Element Is Visible    //*[@class="dc-text" and contains(text(),'5 Ticks')]
    Wait Until Element Is Visible    //input[@value='10']
    Click Element    //*[@id="dt_purchase_call_button"]
    


