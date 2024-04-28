*** Settings ***
Library     SeleniumLibrary
Library    ../.workspace/lib/python3.11/site-packages/robot/libraries/String.py
Resource    Header.robot

*** Variables ***
${product_item}    //div[@class='inventory_item_name ' and text()='%s']//ancestor::div[@class='inventory_item']
${add_to_cart_button}    xpath:.//button[text()='Add to cart']
${remove_button}    xpath:.//button[text()='Remove']
${product_price}    xpath:.//div[@class='inventory_item_price']

*** Keywords ***
Login Success with empty Cart
    Swag Labs logo displays
    Hamberger menu displays
    Cart Item is    0

Add Product To Cart
    [Arguments]    ${product_name}
    ${locator}    Get Add to cart locator     ${product_name}
    Click Element    ${locator} 
    ${locator2}    Get Remove locator    ${product_name}
    Wait Until Page Contains Element    ${locator} 
    Element Should Be Visible     ${locator2}

Get Product Price 
    [Arguments]    ${product_name}
    ${locator}    Get Product Price locator     ${product_name}
    ${price}    Get Text     ${locator} 
    Return From Keyword     ${price} 

Get Add to cart locator 
    [Arguments]    ${product_name}
    ${product_item}    Replace String    ${product_item}    %s    ${product_name}
    ${locator}    Get WebElement    ${product_item} >> ${add_to_cart_button} 
    Return From Keyword     ${locator} 

Get Remove locator 
    [Arguments]    ${product_name}
    ${product_item}    Replace String    ${product_item}    %s    ${product_name}
    ${locator}    Get WebElement    ${product_item} >> ${remove_button}
    Return From Keyword     ${locator} 

Get Product Price locator 
    [Arguments]    ${product_name}
    ${product_item}    Replace String    ${product_item}    %s    ${product_name}
    ${locator}    Get WebElement    ${product_item} >> ${product_price} 
    Return From Keyword     ${locator} 