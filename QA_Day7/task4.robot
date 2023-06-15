*** Settings ***
Documentation  Check relative barrier error
Library  SeleniumLibrary
Resource    resources.robot

*** Variables ***
${BaseURL}          https://app.deriv.com
${duration}         2
${payout}           10
${barrier}          -0.2
${TradeType}        Forex
${TradeTypeSelection}  @class="sc-mcd__filter__item"
${ContractType}     //*[@id="dt_contract_high_low_item"]
${MarketType}       //*[@class="ic-frx ic-frxAUDUSD"]
${BarrierError}     //*[@class="dc-text"and contains(text(),'Contracts more than 24 hours in duration would need an absolute barrier.')]


*** Keywords ***

Verify Error Message
    Wait Until Element Is Visible    //*[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]
    Wait Until Element Is Visible    ${BarrierError}
    

*** Test Cases ***
Check relative barrier error
    Login
    Switch to virtual account
    Enter Deriv Trader
    Select Underlying   
    Select Contract Type
    Select Duration
    Set Barrier
    Set Payout    
    Verify Error Message

