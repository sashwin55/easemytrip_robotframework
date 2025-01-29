** Settings **
Library    SeleniumLibrary
Library    Collections


** Variables **
${URL}      https://www.easemytrip.com/
${BROWSER}  chrome

** Test Cases **
Open easemytrip website
    [Documentation]  Opens easemytrip.com in Chrome browser
    Open Browser     ${URL}  ${BROWSER}

    ...   options=add_argument("--disable-notifications")
    Maximize Browser Window


Enter from and to destinations
    [Documentation]     Entering the from and to destinations to book flight ticket
    Click Element    xpath://div[@id="frmcity"]
    #From destination
    Set Selenium Implicit Wait    4
    Clear Element Text    xpath://input[@id="a_FromSector_show"]
    
    Input Text       xpath://input[@id="a_FromSector_show"]    MAA
    Sleep    2

    Click Element    xpath://span[@id="spnChennai"]
    # //span[text()="Chennai(MAA)"]
    

    #To destination
    Click Element    xpath://input[@id="a_Editbox13_show"]
    Clear Element Text      xpath://input[@id="a_Editbox13_show"]

    Input Text       xpath://input[@id="a_Editbox13_show"]      BOM
    Click Element       xpath://span[@id="spnMumbai"]

    #xpath://span[@id="spnMumbai"]
    Sleep    3
   
    Click Element    xpath://li[@id='fiv_2_31/12/2024']
    Set Selenium Implicit Wait    5
    Click Element    xpath://button[@class="srchBtnSe"]

    Set Selenium Implicit Wait    8

Printing booking details
    [Documentation]     Printing the arrival and departure time details
    ${elements} =       Get WebElements    xpath=//span[@class="txt-r4 ng-binding"]
    ${text}=            Get Text       ${elements[1]}
    Log To Console      ${text}

    #Departure details
    ${elements} =       Get WebElements    xpath=//div[@class="col-md-2 col-sm-2 col-xs-4 top5 "]
    ${text}=            Get Text       ${elements[1]}
    Log To Console      ${text}


    #Arrival details
    ${elements} =       Get WebElements    xpath=//div[@class="col-md-2 col-sm-2 col-xs-3 top5 txdir"]
    ${text}=            Get Text       ${elements[1]}
    Log To Console      ${text}

    #Fare details
    ${elements} =       Get WebElements    xpath=xpath=//div[@class='txt-r6-n ng-scope']"
    ${text}=            Get Text       ${elements[1]}
    Log To Console      ${text}


    #Clicking book now
    ${elements} =       Get WebElements    xpath=//button[text()="Book Now"]
    Click Element       ${elements[1]}

