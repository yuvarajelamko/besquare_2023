*** Settings ***
Documentation  Single test for buying a lower contract
Library  SeleniumLibrary
Resource    resources.robot

*** Variables ***
${BaseURL}          https://app.deriv.com
${duration}         2
${payout}           15.50
${TradeType}        Forex
${TradeTypeSelection}  @class="sc-mcd__filter__item"
${ContractType}     //*[@id="dt_contract_high_low_item"]
${MarketType}       //*[@class="ic-frx ic-frxAUDUSD"]

*** Test Cases ***
Buy Lower Contract
    Login
    Switch to virtual account
    Enter Deriv Trader
    Select Underlying   
    Select Contract Type
    Select Duration
    Set Payout    
    Click Purchase Button

    
