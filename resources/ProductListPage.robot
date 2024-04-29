*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     String
Resource    Header.robot


*** Variables ***
${product_item}             //div[@class='inventory_item_name ' and text()='%s']//ancestor::div[@class='inventory_item']
${add_to_cart_button}       xpath:.//button[text()='Add to cart']
${remove_button}            xpath:.//button[text()='Remove']
${product_price}            xpath:.//div[@class='inventory_item_price']


*** Keywords ***
Login Success With Empty Cart
    Logo Displays Swag Labs
    Hamberger menu Displays
    Cart Item Is    0

Add Product To Cart
    [Arguments]    ${product_name}
    ${locator}    Get Add to Cart Locator    ${product_name}
    Click Element    ${locator}
    ${locator2}    Get Remove Locator    ${product_name}
    Wait Until Page Contains Element    ${locator}
    Element Should Be Visible    ${locator2}

Get Product Price
    [Arguments]    ${product_name}
    ${locator}    Get Product Price Locator    ${product_name}
    ${price}    Get Text    ${locator}
    RETURN    ${price}

Get Add to Cart Locator
    [Arguments]    ${product_name}
    ${product_item}    Replace String    ${product_item}    %s    ${product_name}
    ${locator}    Get WebElement    ${product_item} >> ${add_to_cart_button}
    RETURN    ${locator}

Get Remove Locator
    [Arguments]    ${product_name}
    ${product_item}    Replace String    ${product_item}    %s    ${product_name}
    ${locator}    Get WebElement    ${product_item} >> ${remove_button}
    RETURN    ${locator}

Get Product Price Locator
    [Arguments]    ${product_name}
    ${product_item}    Replace String    ${product_item}    %s    ${product_name}
    ${locator}    Get WebElement    ${product_item} >> ${product_price}
    RETURN    ${locator}

Click Add to Cart
    [Arguments]    ${product_list}
    ${price_list}    Create List
    FOR    ${element}    IN    @{product_list}
        Log    ${element}
        ${current_qty}    Get Total Item From Cart Badge
        Add Product To Cart    ${element}
        ${product_price}    Get Product Price    ${element}
        Append To List    ${price_list}    ${product_price}
        Cart Item Added By 1    ${current_qty}
    END
    RETURN    ${price_list}
