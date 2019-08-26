*** Settings ***
Suite Setup       loginSFDC
Suite Teardown    Close All Browsers
Library           SeleniumLibrary

*** Variables ***
${account_type}    JCI Corporate General Account
@{cat1}           Controls and Accessories    Indoor Units    Multi Zone    Outdoor Units/Outdoor Mini VRF    Single Zone
${subcat}         \    # empty
@{cat2}           Commercial Split System Heat Pumps    Commercial Split Systems    Packaged Heat Pumps    Packaged Rooftop Units
${element1}       //*[@id="a8d4A0000008pOfQAI"]/h5/span/span/i
${element2}       //*[@id="a8d4A0000008pOgQAI"]/h5/span/span/i
${element3}       //*[@id="a8d4A0000008pOhQAI"]/h5/span/span/i
${element4}       //*[@id="a8d4A0000008pOiQAI"]/h5/span/span/i
@{cat3}           Air Conditioners / Split Systems    Air Handling Units (AHUs)    Coils    Gas Furnaces    Heat Pumps    Rooftop Units
@{cat4}           Aftermarket Parts    Commercial Parts    Residential Parts

*** Test Cases ***
reg_loginstore
    Wait Until Element Contains    css:h1.currentStatusUserName>a    JyotiPrakash Panda
    loginStorefront
    Sleep    5s
    loopFOR    ${element1}    @{cat1}
    loopFOR    ${element2}    @{cat2}
    loopFOR    ${element3}    @{cat3}
    loopFOR    ${element4}    @{cat4}

*** Keywords ***
loginSFDC
    Open Browser    https://test.salesforce.com    gc
    Maximize Browser Window
    Set Browser Implicit Wait    20s
    Input Text    css:input#username    jyotiprakash.panda-ext@jci.com
    Input Password    css:input#password    Jyoti@1995
    Click Button    css:input#Login

loginStorefront
    Input Text    css:input#phSearchInput    ${account_type}
    Click Button    css:div#searchButtonContainer>input
    Click Element    xpath://div[@id='Account_body']//a[contains(text(),'JCI Corporate General Account')]
    Click Element    xpath://*[@id="001G000001zNoUG_RelatedContactList_body"]/div/a[2]
    Click Element    xpath://div[@class='listElementBottomNav']//span[@class='listItemPad'][contains(text(),'C')]
    Click Element    xpath://a[contains(text(),'Clarey, Spencer')]
    Sleep    2s
    Click Element    css:#workWithPortalLabel
    Sleep    4s
    Click Link    Log in to Community as User
    sleep    3s
    Select From List    xpath://select[@id='portalUserLoginAsSelect']    Order Navigator
    Click Element    xpath://div[@id='loginAsPortalUserOverlayDialog']//div[@class='middle']//input[1]
    Click Element    xpath://a[contains(text(),'Ducted Residential & Commercial Systems, Ductless')]

loopFOR
    [Arguments]    ${element}    @{cat}
    : FOR    ${subcat}    IN    @{cat}
    \    Log    clicking ${subcat}
    \    Click Element    xpath:${element}
    \    Sleep    5s
    \    Click Link    ${subcat}
    \    Sleep    2s
    \    Scroll Element Into View    css:#viewcartbutton
    \    Sleep    10s
    \    Capture Page Screenshot
    END
