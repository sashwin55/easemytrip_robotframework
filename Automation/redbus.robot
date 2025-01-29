** Settings **
Library    SeleniumLibrary
Library    webdriver_manager

** Variables **
${URL}      https://www.redbus.in/
${BROWSER}  chrome
** Test Cases **
Open redbus.in website
    [Documentation]  Opens redbus.in website in Chrome browser
    Open Browser     ${URL}  ${BROWSER}
    #...   options=add_argument("--disable-notifications")
    Maximize Browser Window


    Click Element    xpath://div[@class="sc-bdVaJa BUCow"]
    Input Text       xpath://input[@id="src"]    Chennai
    Set Selenium Implicit Wait    5
    ${elements} =       Get WebElements    xpath=//*[@class="placeHolderMainText"]
    #   //*[@class="sc-dnqmqq dZhbJF"]
    Click Element       ${elements[2]}

    Click Element    xpath://*[@class="sc-bdVaJa ckpqdK"]
    # //label[text()="To"]
    Input Text       xpath://input[@id="dest"]     Madurai

    Click Element    xpath://div[@id="onwardCal"]
    Click Element    xpath://*[@id="Layer_1"]
    Click Element    xpath://span[text()="15"]
    #Set Selenium Implicit Wait    5
    Sleep    5
    Click Element    xpath://button[@id="search_button"]
    Log To Console   search clicked
    #Select From List By Value    xpath://ul[@class="sc-dnqmqq dZhbJF"]   ,     Madurai
    
    Set Selenium Implicit Wait    7
    ${elements} =       Get WebElements    xpath=//div[@class="travels lh-24 f-bold d-color"]
    # Click Element       ${elements[1]}
    Log To Console    ${elements[1]}

    Log To Console    browser done


