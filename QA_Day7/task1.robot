*** Settings ***
Documentation  single test to switch to virtual account
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