#*** Settings ***
#Library    SeleniumLibrary
#
#*** Variables ***
#
#
#*** Keywords ***
#Launch the application on requested browser
#    [Arguments]                 ${url}      ${browser}
#    open browser                ${url}      ${browser}
#    maximize browser window
#    title should be             OrangeHRM
#    sleep                       5s