*** Settings ***
Documentation  Check multiplier contract parameter
Library  SeleniumLibrary
Resource    resources.robot

*** Variables ***
${MyEmail}          yuvaraj@besquare.com.my
${MySecret}			Yuva@2796
${BaseURL}          https://app.deriv.com
${duration}         2
${stake}           10
${barrier}          -0.2
${TradeType}        Synthetics
${ContractType}     //*[@id="dt_contract_multiplier_item"]
${MarketType}       //*[@class="sc-mcd__item sc-mcd__item--R_50 "]

*** Keywords ***

Verify Error Message
    Wait Until Element Is Visible    //*[@class="trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled"]
    Wait Until Element Is Visible    //*[@class="dc-text"and contains(text(),'Contracts more than 24 hours in duration would need an absolute barrier.')]
    
*** Test Cases ***
Check multiplier contract parameter
    Login
    Switch to virtual account
    Select Underlying   
    Select Contract Type
    Select Duration
    Set Barrier
    Set Stake    
    Verify Error Message


    
