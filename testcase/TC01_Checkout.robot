*** Settings ***
Resource    ../Keyword/Util.robot
Resource    ../Keyword/Login.robot
Resource    ../keyword/ProductList.robot
Resource    ../keyword/Cart.robot
Resource    ../keyword/Checkout.robot
Resource    ../keyword/Payment.robot
Resource    ../keyword/ThankYou.robot

Suite Setup    Run Keyword    Open Web Browser
Suite Teardown    Close Browser

*** Test Cases ***
TC_01 - E2E checkout cart
    Title Should Be    Swag Labs
    Logo Displays Swag Labs
    Login Form Displays Correctly
    Login with credentials    ${LOGIN_USERNAME}    ${LOGIN_PASSWORD}
    Login Success With Empty Cart

    ${product_list}    Create List    Sauce Labs Backpack    Sauce Labs Bolt T-Shirt
    ${price_list}    Click Add to Cart    ${product_list} 
    Click View Cart 
    Cart Title Displays Correctly
    Product and Qty Is Added Correctly     ${product_list}     ${price_list}  
    Click Checkout Button 

    Checkout Title Displays Correctly
    Input Checkout Detail    testname    testlastname    123456
    Click Continue Button 

    Payment Calculate Correctly    ${price_list}
    Click Finish Button
    Thank You Page Displays Correctly

