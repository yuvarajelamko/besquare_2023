*** Settings ***
Documentation  Check multiplier contract parameter
Library  SeleniumLibrary
Resource    resources.robot

*** Variables ***
${BaseURL}          https://app.deriv.com
${TradeType}        Synthetics
${ContractType}     //*[@id="dt_contract_multiplier_item"]
${MarketType}       //*[@class="sc-mcd__item sc-mcd__item--R_50 "]

${multiplier_dropdown}        //*[@data-testid="dti_dropdown_display"]
${multiplier_20_dd}           //*[@data-testid="dti_list_item" and  @id="20"]
${multiplier_20_selection}    //*[@name="multiplier" and contains(text(), 'x20')]
${multiplier_40_dd}           //*[@data-testid="dti_list_item" and  @id="40"]
${multiplier_40_selection}    //*[@name="multiplier" and contains(text(), 'x40')]
${multiplier_60_dd}           //*[@data-testid="dti_list_item" and  @id="60"]
${multiplier_60_selection}    //*[@name="multiplier" and contains(text(), 'x60')]
${multiplier_100_dd}          //*[@data-testid="dti_list_item" and  @id="100"]
${multiplier_100_selection}   //*[@name="multiplier" and contains(text(), 'x100')]
${multiplier_200_dd}          //*[@data-testid="dti_list_item" and  @id="200"]
${multiplier_200_selection}   //*[@name="multiplier" and contains(text(), 'x200')]

${cancellation_checkbox}      //*[@class="dc-checkbox"]//span[@class="dc-checkbox__box"]
${cancellation_dropdown}      //*[@name="cancellation_duration" and @class="dc-text dc-dropdown__display-text"]
${cancellation_5_dd}          //*[@data-testid="dti_list_item" and  @id="5m"]
${cancellation_5_selection}   //*[@name="cancellation_duration" and contains(text(), '5 minutes')]
${cancellation_10_dd}         //*[@data-testid="dti_list_item" and  @id="10m"]
${cancellation_10_selection}  //*[@name="cancellation_duration" and contains(text(), '10 minutes')] 
${cancellation_15_dd}         //*[@data-testid="dti_list_item" and  @id="15m"]
${cancellation_15_selection}  //*[@name="cancellation_duration" and contains(text(), '15 minutes')]   
${cancellation_30_dd}         //*[@data-testid="dti_list_item" and  @id="30m"]
${cancellation_30_selection}  //*[@name="cancellation_duration" and contains(text(), '30 minutes')] 
${cancellation_60_dd}         //*[@data-testid="dti_list_item" and  @id="60m"]
${cancellation_60_selection}  //*[@name="cancellation_duration" and contains(text(), '60 minutes')] 
${cancellation_fee_output}    //*[@class="trade-container__price-info-currency"]

${takeprofit_checkbox}        //*[@class="dc-checkbox take_profit-checkbox__input"]//span[@class="dc-checkbox__box"]
${takeprofit_hint}            //*[@data-tooltip="Please enter a take profit amount."]
${takeprofit_input}           //*[@id="dc_take_profit_input"]
${takeprofit_add_button}     //*[@id="dc_take_profit_input_add"]   
${takeprofit_minus_button}    //*[@id="dc_take_profit_input_sub"] 


*** Keywords ***

Stake value parameter testing
    Clear Input Field   ${StakeInput}
    Wait Until Page Contains   Amount is a required field.   20
    Set Stake (without toggle)    0.99
    Wait Until Page Contains   Please enter a stake amount that's at least 1.00.   20
    Set Stake (without toggle)    2001
    Wait Until Page Contains   Maximum stake allowed is 2000.00.   20

Cancellation fee correlation testing
    Set Stake (without toggle)    1000
    Click Element   ${cancellation_checkbox}
    Sleep   5s
    Wait Until Element Is Visible  ${cancellation_fee_output}  30
    ${cancellation_fee}=    Get Text    ${cancellation_fee_output}
    ${cancellation_fee}=    Evaluate    "${cancellation_fee}".split(" ")[0]
    ${cancellation_fee}=    Convert To Number    ${cancellation_fee}
    Set Stake (without toggle)    1500
    Sleep   5s
    ${new_cancellation_fee}=    Get Text    ${cancellation_fee_output}
    ${new_cancellation_fee}=    Evaluate    "${new_cancellation_fee}".split(" ")[0]
    ${new_cancellation_fee}=    Convert To Number    ${new_cancellation_fee}
    Run Keyword If    ${cancellation_fee} > ${new_cancellation_fee}    Log    Cancellation fee is more expensive when the stake is higher
    ...    ELSE    Log    Cancellation fee is lower when the stake is higher (Bug)


Multiplier value selection testing
    Wait Until Element Is Enabled    ${multiplier_dropdown}    10
    Click Element    ${multiplier_dropdown}
    Wait Until Page Contains Element    ${multiplier_20_dd}    
    Wait Until Page Contains Element    ${multiplier_40_dd}    
    Wait Until Page Contains Element    ${multiplier_60_dd}    
    Wait Until Page Contains Element    ${multiplier_100_dd}    
    Wait Until Page Contains Element    ${multiplier_200_dd}
    Click Element    ${multiplier_20_dd}
    Wait Until Page Contains Element    ${multiplier_20_selection}
    Click Element    ${multiplier_dropdown}    
    Click Element    ${multiplier_40_dd}
    Wait Until Page Contains Element    ${multiplier_40_selection}
    Click Element    ${multiplier_dropdown}  
    Click Element    ${multiplier_60_dd}
    Wait Until Page Contains Element    ${multiplier_60_selection}
    Click Element    ${multiplier_dropdown}  
    Click Element    ${multiplier_100_dd}
    Wait Until Page Contains Element    ${multiplier_100_selection}
    Click Element    ${multiplier_dropdown}  
    Click Element    ${multiplier_200_dd}
    Wait Until Page Contains Element    ${multiplier_200_selection}         

Multiplier value cancellation testing
    Wait Until Element Is Visible    ${cancellation_dropdown}    
    Click Element    ${cancellation_dropdown}
    Wait Until Page Contains Element    ${cancellation_5_dd}    
    Wait Until Page Contains Element    ${cancellation_10_dd}    
    Wait Until Page Contains Element    ${cancellation_15_dd}    
    Wait Until Page Contains Element    ${cancellation_30_dd}    
    Wait Until Page Contains Element    ${cancellation_60_dd}    
    Click Element    ${cancellation_5_dd}
    Wait Until Page Contains Element    ${cancellation_5_dd}
    Click Element    ${cancellation_dropdown}    
    Click Element    ${cancellation_10_dd}
    Wait Until Page Contains Element    ${cancellation_10_dd}
    Click Element    ${cancellation_dropdown}
    Click Element    ${cancellation_15_dd}
    Wait Until Page Contains Element    ${cancellation_15_dd}
    Click Element    ${cancellation_dropdown}  
    Click Element    ${cancellation_30_dd}
    Wait Until Page Contains Element    ${cancellation_30_dd}
    Click Element    ${cancellation_dropdown}  
    Click Element    ${cancellation_60_dd} 
    Wait Until Page Contains Element    ${cancellation_60_dd}

Take profit field testing  
    Click Element    ${takeprofit_checkbox}
    Wait Until Element Is Visible    ${takeprofit_hint}
    Clear Input Field   ${takeprofit_input}
    Click Element    ${takeprofit_add_button}
    ${profit}=    Get Value    ${takeprofit_input}
    Should Be Equal    1    ${profit}
    Click Element    ${takeprofit_minus_button}
    ${profit}=    Get Value    ${takeprofit_input}
    Should Be Equal    0    ${profit}
    


*** Test Cases ***
Check multiplier contract parameter
    Login
    Switch to virtual account
    Enter Deriv Trader  
    Select Underlying
    Select Contract Type
    Stake value parameter testing
    Cancellation fee correlation testing
    Multiplier value selection testing
    Multiplier value cancellation testing
    Take profit field testing

      



    
