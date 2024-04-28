*** Settings ***
Resource    ../resources/Util.robot
Resource    ../resources/LoginPage.robot
Resource    ../resources/ProductListPage.robot
Resource    ../resources/CartPage.robot
Resource    ../resources/CheckoutPage.robot
Resource    ../resources/PaymentPage.robot
Resource    ../resources/ThankYouPage.robot

Suite Setup    Util.Open Web Browser
Suite Teardown    Close Browser

*** Test Cases ***
TC_01 - E2E checkout cart
    SeleniumLibrary.Title Should Be    Swag Labs
    Header.Logo Displays Swag Labs
    LoginPage.Login Form Displays Correctly
    LoginPage.Login with credentials    ${LOGIN_USERNAME}    ${LOGIN_PASSWORD}
    ProductListPage.Login Success With Empty Cart

    ${product_list}    BuiltIn.Create List    Sauce Labs Backpack    Sauce Labs Bolt T-Shirt
    ${price_list}    ProductListPage.Click Add to Cart    ${product_list} 
    Header.Click View Cart 
    CartPage.Cart Title Displays Correctly
    CartPage.Product and Qty Is Added Correctly     ${product_list}     ${price_list}  
    CartPage.Click Checkout Button 

    CheckoutPage.Checkout Title Displays Correctly
    CheckoutPage.Input Checkout Detail    testname    testlastname    123456
    CheckoutPage.Click Continue Button 

    PaymentPage.Payment Calculate Correctly    ${price_list}
    PaymentPage.Click Finish Button
    ThankYouPage.Thank You Page Displays Correctly

