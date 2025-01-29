** Settings **
Library             SeleniumLibrary
Library    Collections
Library    String
Library    Screenshot
Variables           ../PageObjects/locators.py

*** Keywords ***
Open my browser
    [Documentation]   Opening the browser
    [Arguments]  ${URL}  ${BROWSER}

    Open Browser  ${URL}  ${BROWSER}
    ...   options=add_argument("--disable-notifications")
    Maximize Browser Window


Enter destinations
    [Documentation]     Entering departure and arrival destinations and clicking "Search"
    [Arguments]   ${from_city}  ${to_city}

    #from destination
    TRY
      Click Element         ${txt_box_from}
      Clear Element Text    ${clear_element_from}
      Set Selenium Implicit Wait    4
      Input Text       ${from_location_txt}    ${from_city}
      Sleep    3
      Wait Until Element Is Visible    ${from_location_click}     10
      Sleep    3
      Click Element    ${from_location_click}

    # Exception Handling
    EXCEPT    
      Sleep    5
      Click Element    xpath://p/span[contains(text(),'Chennai')]
    END

    #to destination
    TRY
      Click Element    ${txt_box_to}
      Input Text       ${to_location_txt}   ${to_city}
      Wait Until Element Is Visible    ${to_location_click}
      Sleep    3
      Click Element    ${to_location_click}

    # Exception Handling
    EXCEPT
      Sleep    5
      Click Element    xpath://p/span[contains(text(),'Mumbai')]
    END

    Click Element    ${date}
    Set Selenium Implicit Wait    5
    Click Element    ${searchBtn}

Clicking book now for the highest price
    [Documentation]     Entering into flight booking page and booking ticket with the highest price
    Wait Until Element Is Visible    ${fare_details}
    @{fares}    Get Webelements    ${fare_details}   #storing the webelements in fares list
    ${fare_values}    Create List
    FOR    ${element}    IN    @{fares}
        ${fare_text}    Get Text    ${element}  # This retrieves the text from the current web element ${element} and stores it in the variable.
        Set Global Variable    ${price_text}      ${fare_text}   # This global variable helps select the "Book Now" button for the highest-priced flight.
        ${replace} =   Replace String  ${fare_text}   ,    ${EMPTY}
        ${fare_number}   Convert To Integer   ${replace}
        Append To List    ${fare_values}    ${fare_number}  # storing the converted integer fare values inside the list
    END
    ${highest_fare}    Evaluate    max(${fare_values})
    Log To Console    The highest fare is: ₹ ${highest_fare}  #evaluating and printing the highest price value

    Sleep    2
    Scroll Element Into View       xpath://span[text()='${price_text}']/ancestor::div[contains(@class,'mr5 cle')]//following-sibling::div//button[text()='Book Now']
    Click Element    xpath://span[text()='${price_text}']/ancestor::div[contains(@class,'mr5 cle')]//following-sibling::div//button[text()='Book Now']
    
Entering into booking page
    [Documentation]     Performing some operations in the payment page
    Sleep    6
    Scroll Element Into View    ${radio_button}
    Sleep    4
    Click Element    ${radio_button}
    Sleep    4
    Scroll Element Into View    ${email_text}
    Click Element               ${email_text}
    Sleep    4
    Input Text    ${email_text}    logadeep@yopmail.com
    Click Element    ${continue_booking_button}
    
    Sleep    5

    Click Element    ${first_name_field}
    Input Text    ${first_name_field}    Sashwin
    Sleep    6
    
    Click Element    ${plus_button}
    Sleep    3
    # Selecting meal preference
    Click Element    ${meal_preference}
    Sleep    3
    # selecting value from dropdown
    Select From List By Value    id:txtFFMealAdult0   Baby Meal
    Sleep    1
    #${baby_meal}

    
Close the browser
    Close Browser

