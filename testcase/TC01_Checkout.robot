*** Settings ***
Library    Collections.py
Resource    ../Keyword/Util.robot
Resource    ../Keyword/Login.robot
Resource    ../keyword/ProductList.robot
Resource    ../keyword/Cart.robot
Resource    ../keyword/Checkout.robot
Resource    ../keyword/Payment.robot
Resource    ../keyword/ThankYou.robot
Resource    ../keyword/Header.robot
Variables   ../env/test.yaml

Suite Setup    Run Keyword    Open Web Browser    ${URL}    ${BROWSER}
Suite Teardown    Close Browser


*** Test Cases ***
TC_01 - E2E checkout cart
    Title Should Be    Swag Labs
    Swag Labs logo displays
    Login form displays
    Login with credentials    ${LOGIN_USERNAME}    ${LOGIN_PASSWORD}
    Login Success with empty Cart

    ${product_list}    Create List    Sauce Labs Backpack    Sauce Labs Bolt T-Shirt
    ${price_list}    Create List 
    FOR    ${element}    IN    @{product_list}
        Log    ${element}
        ${current_qty}    Get No Item from cart
        Add Product To Cart    ${element}    
        ${product_price}    Get Product Price   ${element}    
        Append To List    ${price_list}      ${product_price}
        Cart Item Added By 1    ${current_qty}
    END

    Click View Cart 
    Cart Title displays correctly
    FOR    ${l1-element}    ${l2-element}    IN ZIP    ${product_list}    ${price_list}
        Log    ${l1-element} - ${l2-element}
        Product Added To Cart Correctly    ${l1-element}    1     ${l2-element}
    END
    Click checkout 

    Checkout Title displays correctly
    Input Checkout Detail    testname    testlastname    123456
    Click Continue 

    Payment calculate correctly    ${price_list}
    Click finish
    Thank you page displays correctly

