*** Settings ***
Library     SeleniumLibrary
Library    ../.workspace/lib/python3.11/site-packages/robot/libraries/String.py
Resource    Util.robot

*** Variables ***
${title}    class:title
${firstname_txt}    id:first-name
${lastname_txt}    id:last-name
${zipcode_txt}    id:postal-code
${continue_button}    id:continue

*** Keywords ***
Checkout Title Displays Correctly
    ${text}=    Get Text    ${title}
    Should Be Equal    ${text}    Checkout: Your Information

Input Checkout Detail
    [Arguments]    ${firstname}    ${lastname}    ${zipcode}
    Input Text And Check Input Value Match       ${firstname_txt}    ${firstname}
    Input Text And Check Input Value Match       ${lastname_txt}    ${lastname}
    Input Text And Check Input Value Match       ${zipcode_txt}    ${zipcode}

Click Continue Button 
    Click Button    ${continue_button}


