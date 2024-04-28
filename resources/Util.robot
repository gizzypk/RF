*** Settings ***
Library     SeleniumLibrary
Variables   ../env/test.yaml

*** Keywords ***
Open Web Browser
    [Arguments]    ${url}=${URL}    ${browser}=chrome
    Open Browser    ${url}    ${browser}    alias=saucedemo    options=binary_location="${EXECDIR}/chrome/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing"    #;add_experimental_option("detach", True)
    ...    executable_path=${EXECDIR}/chrome/chromedriver

Input Text And Check Input Value Match
    [Arguments]    ${locator}    ${text}
    Input Text     ${locator}   ${text}  
    Element Attribute Value Should Be  ${locator}    value    ${text} 

Input Password And Check Input Value Match
    [Arguments]    ${locator}    ${text}
    Input Password     ${locator}   ${text}  
    Element Attribute Value Should Be  ${locator}    value    ${text} 