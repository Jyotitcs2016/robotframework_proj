*** Settings ***
Suite Teardown
Test Setup        Open Browser
Test Teardown     Close All Browsers    # closing browser
Default Tags      base
Library           SeleniumLibrary

*** Variables ***
${Username}       jyotiprakash.panda-ext@jci.com
${password}       Jyoti@1995
${name}           Jyoti Prakash
${URL}            https://test.salesforce.com

*** Test Cases ***
reg_loginstore_ie
    Sleep    10s
    Wait Until Element Contains    css:h1.currentStatusUserName>a    JyotiPrakash Panda
    loginStorefront
    Sleep    5s
    : FOR    ${subcat}    IN    @{cat1}
    \    Log    clicking ${subcat}
    \    Click Element    xpath://*[@id="a8d4A0000008pOfQAI"]/h5/span/span/i
    \    Sleep    5s
    \    Click Link    ${subcat}
    \    Sleep    10s
    \    Scroll Element Into View    css:#viewcartbutton
    END

*** Keywords ***
open browser
    SeleniumLibrary.Open Browser    ${URL}    ie
    Input Text    id=ContentPlaceHolder1_txtuserid    ${Username}
    Input Password    xpath=//input[@name='ctl00$ContentPlaceHolder1$txtpassword']    ${password}
    Log To Console    Id password entered

close browser
    Close Browser

Click Element
    Click Element    xpath=//span[@class='checkbox checkbox-slider--b-flat']
    Click Button    xpath=//input[@name='ctl00$ContentPlaceHolder1$btnSubmit']
    Element Should Contain    xpath=//span[@id='ContentPlaceHolder1_lblCandName']    Jyoti Prakash
    Log To Console    Welcome note contains ${name}

loginSFDC_ie
    Open Browser    https://test.salesforce.com    gc
    Maximize Browser Window
    Input Text    css:input#username    jyotiprakash.panda-ext@jci.com
    Input Password    css:input#password    Jyoti@1995
    Click Button    css:input#Login
