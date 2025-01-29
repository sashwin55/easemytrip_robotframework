** Settings **
Library    SeleniumLibrary
#Library    webdriver_manager

** Variables **
${URL}      https://www.saucedemo.com/
${BROWSER}  chrome

** Keywords **
Launch Browser
    Open Browser     ${URL}  ${BROWSER}
    Maximize Browser Window
Click Element By XPath
    [Arguments]    ${xpath}
    Click Element    xpath=${xpath}
    Log To Console    Clicked element with XPath: ${xpath}

** Test Cases **
Opening saucedemo
   Launch Browser
   Input Text    xpath: //input[@id="user-name"]    standard_user
   Input Text    xpath: //input[@id="password"]     secret_sauce
   Click Element By XPath    xpath=//input[@id="login-button"]
   
   Set Selenium Implicit Wait    6

   ${elements} =       Get WebElements    xpath=//*[@class="inventory_item_name "]
   ${text}=            Get Text       ${elements[3]}
   Log To Console   ${text}

   #Capture Page Screenshot