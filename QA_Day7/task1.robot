*** Settings ***
Documentation  Single test to switch to virtual account
Library  SeleniumLibrary
Resource    resources.robot

*** Test Cases ***
Switch to virtual account
    Login
    Switch to virtual account