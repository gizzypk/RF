*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${logo}    //*[@class='app_logo' or @class='login_logo']
${hamburger_menu}    class:bm-burger-button
${cart_badge}    class:shopping_cart_badge
${cart_link}    class:shopping_cart_link

*** Keywords ***
Swag Labs logo displays
    Wait Until Element Is Visible    ${logo}
    Element Text Should Be    ${logo}    Swag Labs

Hamberger menu displays
    Element Should Be Visible    ${hamburger_menu}

Cart Item is 
    [Arguments]    ${expect_value}
    ${value}    Get No Item from cart
    Should Be Equal    ${value}     ${expect_value}

Get No Item from cart
    ${result}    Run Keyword And Return Status	     Element Should Not Be Visible    ${cart_badge}
    IF    '${result}'=='True' 
        RETURN    0
    ELSE
        ${total}     Get Text   ${cart_badge}  
        RETURN    ${total} 
    END

Click View Cart 
    Click Element    ${cart_link}

Cart Item Added By 1
    [Arguments]    ${qty}
    ${current_qty}     Get No Item from cart
    ${expect_qty}    Evaluate    ${qty}+1
    Should Be Equal As Integers     ${current_qty}      ${expect_qty}