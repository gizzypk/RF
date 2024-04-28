*** Settings ***
Library     SeleniumLibrary
Library    ../.workspace/lib/python3.11/site-packages/robot/libraries/String.py
Resource    Header.robot


*** Variables ***
${image}    class:pony_express
${thank_you_header}    class:complete-header
${thank_you_subtitle}    class:complete-text
${back_to_home_button}    id:back-to-products

*** Keywords ***
Thank you page displays correctly
    Element Should Be Visible    ${image} 
    Element Text Should Be    ${thank_you_header}     Thank you for your order!
    Element Text Should Be    ${thank_you_subtitle}    Your order has been dispatched, and will arrive just as fast as the pony can get there!
    Element Should Be Enabled    ${back_to_home_button}
    Capture Page Screenshot