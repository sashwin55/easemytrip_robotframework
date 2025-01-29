*** Settings ***
Library         SeleniumLibrary
Resource        ../Resources/easemytrip_keywords.robot


*** Variables ***
${URL}              https://www.easemytrip.com/
${BROWSER}          chrome
${from_city}        MAA
${to_city}          BOM

*** Test Cases ***
Launch the page
    Open my browser    ${URL}     ${BROWSER}

Booking flights
    Enter destinations    ${from_city}    ${to_city}

Launching payment page
    Clicking book now for the highest price
    Entering into booking page

Closing the browser
    Close the browser

