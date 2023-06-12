*** Settings ***
Documentation  single test for login
Library  SeleniumLibrary

*** Test Cases ***
login
    Open Browser   https://deriv.com    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //a[@class="live-pricing-section-module--button_table--ff134 link-button primary outlined typography-link typography typography-font-UBUNTU typography-break-word"]   10s    
    Click Element  //a[@class="live-pricing-section-module--button_table--ff134 link-button primary outlined typography-link typography typography-font-UBUNTU typography-break-word"]
    Wait Until Page Contains Element    //button[@class="_styles__MarketButton-sc-j1c037-2 gmkiuB"]    10s
    Go Back
    Wait Until Page Contains Element    //button[@class="button live-pricing-section-module--button_table--ff134 primary text-small typography-weight-bold"]
    Click Element  //button[@class="button live-pricing-section-module--button_table--ff134 primary text-small typography-weight-bold"]
    Wait Until Page Contains Element    //button[@class="dc-btn dc-btn--primary"]   10s  
    Go Back
    Wait Until Page Contains Element    //a[@class="typography-link typography padding-bottom-6x text-small typography-break-word typography-hover"]   10s  
    Click Element  //a[@class="typography-link typography padding-bottom-6x text-small typography-break-word typography-hover"]
    Wait Until Page Contains Element    //h4[@class="typography__Header-sc-10mkw78-1 _available-trades_desktop__CardHeader-sc-16r9bp0-6 jBfgdg dtQJSk" and contains(text(),'CFDs')]
    Click Element  //h4[@class="typography__Header-sc-10mkw78-1 _available-trades_desktop__CardHeader-sc-16r9bp0-6 jBfgdg dtQJSk" and contains(text(),'Options')]


