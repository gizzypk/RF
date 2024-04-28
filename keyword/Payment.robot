*** Settings ***
Library     SeleniumLibrary
Library    ../.workspace/lib/python3.11/site-packages/robot/libraries/String.py

*** Variables ***
${payment_itemtotal}    class:summary_subtotal_label
${payment_tax}    class:summary_tax_label
${payment_total}    class:summary_total_label
${finish_button}    id:finish

*** Keywords ***
Payment Calculate Correctly
    [Arguments]    ${price_list}
    ${item_price}    Payment Item Is Correct      ${price_list}
    ${tax_price}    Set Variable    3.68
    Payment Tax Is Correct    ${tax_price} 
    ${total_product_amount}    Evaluate      ${item_price} + ${tax_price} 
    Payment Total Is Correct    ${total_product_amount} 

Payment Item Is Correct 
    [Arguments]    ${price_list}
    ${total_product_amount}    Set Variable    0
    FOR    ${element}    IN    @{price_list}
        Log    ${element}
        ${product_amount}    Remove String    ${element}   $
        ${product_amount}    Convert To Number    ${product_amount}
        ${total_product_amount}    Evaluate      ${total_product_amount} + ${product_amount}
    END
    ${actual_product_amount}    Get Text    ${payment_itemtotal} 
    ${actual_product_amount}    Split String From Right	   ${actual_product_amount}    ${None}    1
    ${actual_product_amount}    Remove String    ${actual_product_amount}[1]   $
    ${acutal_product_amount}    Convert To Number    ${actual_product_amount}
    Should Be Equal As Integers      ${total_product_amount}    ${acutal_product_amount} 
    RETURN    ${total_product_amount}

Payment Tax Is Correct
    [Arguments]    ${total_price}
    ${actual_tax_amount}    Get Text    ${payment_tax} 
    ${actual_tax_amount}    Split String From Right	   ${actual_tax_amount}    ${None}    1
    ${actual_tax_amount}    Remove String    ${actual_tax_amount}[1]   $
    ${actual_tax_amount}    Convert To Number    ${actual_tax_amount}
    ${total_price}    Convert To Number    ${total_price}
    Should Be Equal As Integers      ${total_price}    ${actual_tax_amount} 
  
Payment Total Is Correct
    [Arguments]    ${total_price}
    ${actual_total_amount}    Get Text    ${payment_total} 
    ${actual_total_amount}    Split String From Right	   ${actual_total_amount}    ${None}    1
    ${actual_total_amount}    Remove String    ${actual_total_amount}[1]   $
    ${actual_total_amount}    Convert To Number    ${actual_total_amount}
    ${total_price}    Convert To Number    ${total_price}
    Should Be Equal As Integers      ${total_price}    ${actual_total_amount} 

Click Finish Button
    Click Element    ${finish_button}
    

