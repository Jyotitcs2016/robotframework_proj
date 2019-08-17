*** Settings ***
Suite Teardown
Test Setup        Open Browser
Test Teardown     Close All Browsers    # closing browser
Default Tags      base
Library           SeleniumLibrary

*** Variables ***
${Username}       jyotiprakash569@gmail.com
${password}       Password12@
${name}           Jyoti Prakash
${URL}            https://careers.infosys.com/LaunchPadCandidate/Aspx/Login/LogIn.aspx

*** Test Cases ***
tc1-open Browser
    Click Element

checkKeywords
    [Tags]    logincheck
    open browser
    Click Element    xpath=//span[@class='checkbox checkbox-slider--b-flat']
    Click Button    xpath=//input[@name='ctl00$ContentPlaceHolder1$btnSubmit']
    close browser

*** Keywords ***
open browser
    SeleniumLibrary.Open Browser    ${URL}    gc
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
