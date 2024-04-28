*** Settings ***
Library     SeleniumLibrary
Library    ../.workspace/lib/python3.11/site-packages/robot/libraries/String.py

*** Variables ***
${title}    class:title
${cart_product_item}    //div[@class='inventory_item_name' and text()='%s']//ancestor::div[@class='cart_item']
${product_qty}    class:cart_quantity
${product_price}    class:inventory_item_price
${check_out_button}    id:checkout

*** Keywords ***
Cart Title Displays Correctly
    ${text}=    Get Text    ${title}
    Should Be Equal    ${text}    Your Cart

Get Product Price Locator
    [Arguments]    ${product_name}
    ${product_item}    Replace String    ${cart_product_item}    %s    ${product_name}
    ${locator}    Get WebElement    ${product_item} >> ${product_price} 
    Return From Keyword     ${locator} 

Get Prodct Qty Locator
    [Arguments]    ${product_name}
    ${product_item}    Replace String    ${cart_product_item}    %s    ${product_name}
    ${locator}    Get WebElement    ${product_item} >> ${product_qty} 
    Return From Keyword     ${locator} 

Product Added To Cart Correctly 
    [Arguments]    ${product_name}    ${qty}    ${price}
    ${locator}    Get Product Price Locator    ${product_name}
    ${locator2}     Get Prodct Qty Locator     ${product_name}
    ${actual_price}    Get Text     ${locator}   
    ${actual_qty}    Get Text     ${locator2}   
    Should Be Equal     ${actual_price}     ${price}
    Should Be Equal     ${actual_qty}     ${qty}

Click Checkout Button 
    Click Button    ${check_out_button}

Product and Qty Is Added Correctly
    [Arguments]    ${product_list}    ${price_list}
    FOR    ${l1-element}    ${l2-element}    IN ZIP    ${product_list}    ${price_list}
        Log    ${l1-element} - ${l2-element}
        Product Added To Cart Correctly    ${l1-element}    1     ${l2-element}
    END