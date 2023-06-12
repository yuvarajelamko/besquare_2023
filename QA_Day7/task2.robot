*** Settings ***
Documentation  Single test for buy rise contract
Library  SeleniumLibrary
Resource    resources.robot

*** Variables ***
${BaseURL}          https://app.deriv.com
${TradeType}        Synthetics
${TradeTypeSelection}  //*[@class="sc-mcd__filter__subgroups-item sc-mcd__filter__item--active sc-mcd__filter__item--selected"]
${ContractType}     //*[@id="dt_contract_high_low_item"]
${MarketType}       //*[@class="sc-mcd__item sc-mcd__item--1HZ10V "]


*** Test Cases ***
Buy Rise Contract
    Login
    Switch to virtual account
    Enter Deriv Trader
    Select Underlying
    Select Contract Type
    Click Element    //*[@id="dc_t_toggle_item"]
    Wait Until Element Is Visible    //*[@class="dc-text" and contains(text(),'5 Ticks')]
    Wait Until Element Is Visible    //input[@value='10']
    Click Element    //*[@id="dt_purchase_call_button"]
    


