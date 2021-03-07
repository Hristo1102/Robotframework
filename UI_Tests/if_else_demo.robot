*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn

*** Variables ***

${URL} =  https://www.saucedemo.com/
${BROWSER} =  ff

*** Test Cases ***
Test case to demonstrate the if/else in Robotframework
    [Documentation]  Test case to demonstrate the if/else in Robotframework
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    Input Text  id:user-name  standard_user
    Input Text  id:password   secret_sauce
    Click Button  xpath://*[@id="login-button"]

    ${items_on_page} =  Get Element Count  xpath://*[@id="inventory_container"]/div

    Run Keyword If  ${items_on_page} == 10  Test Keyword 1
    ...  ELSE IF  ${items_on_page} < 10 and ${items_on_page} > 6  Test Keyword 2
    ...  ELSE  Test Keyword 3

*** Keywords ***
Test Keyword 1
    Log To Console  Executed Keyword1 - Found Items as expected
    Close Browser
Test Keyword 2
    Log To Console  Executed Keyword2 - Found less than expected Itesms
    Close Browser
Test Keyword 3
    Log To Console  Executed Keyword3 - Exception
    Close Browser
