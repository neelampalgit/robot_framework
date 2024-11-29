*** Settings ***
Library    SeleniumLibrary
Resource    ./app_keywords.robot
Library    user_funcs.py

*** Variables ***
#${username}     Admin
#${password}     admin123
${url}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}      chrome
${username}
${password}
${number1}      10
${number2}      20

*** Test Cases ***
Test to add two numbers
    ${sum}=     add nbrs        10      20
    log to console    The sum is: ${sum}

Greet specific user
    ${greeting}=    greet user    Neelam
    log to console    ${greeting}

Login to OrangeHRM Demp Application
    [Documentation]    This test case will test login functionality of orange hrm demo application
    Launch the application on requested browser     ${url}      ${browser}
    input text                  name=username                   ${username}
    input text                  name=password                   ${password}
    click button                css=.orangehrm-login-button
    sleep                       7s
    page should contain         Dashboard
    log to console              Login Passed
    close browser


Login to OrangeHRM Demo Application with multiple users
    [Documentation]    This test case will test login functionality of orange hrm demo application
    FOR     ${username}      ${password}    IN
    ...     Admin            admin123
    ...     wrongAdmin       admin123
    ...     Admin            wrongadmin123
            Launch the application on requested browser     ${url}      ${browser}
            input text                  name=username                   ${username}
            input text                  name=password                   ${password}
            click button                css=.orangehrm-login-button
            sleep                       7s
            run keyword and continue on failure    page should contain         Dashboard
            log to console              Login Passed
            close browser
    END
