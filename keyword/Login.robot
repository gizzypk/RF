*** Settings ***
Library     SeleniumLibrary
Resource    Util.robot

*** Variables ***
${username_txt}    id:user-name
${password_txt}    id:password
${login_button}    class:submit-button 

*** Keywords ***
Login Form Displays Correctly
    Element Should Be Visible    ${username_txt}
    Element Should Be Visible    ${password_txt}
    Element Should Be Visible    ${login_button}

Login With Credentials
    [Arguments]    ${username_value}    ${password_value}
    Input Text And Check Input Value Match    ${username_txt}   ${username_value}  
    Input Password And Check Input Value Match     ${password_txt}     ${password_value}
    Click Element    ${login_button} 