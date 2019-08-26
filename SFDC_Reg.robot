*** Settings ***
Suite Setup       loginSFDC
Suite Teardown    Close All Browsers
Library           SeleniumLibrary

*** Variables ***
${account_type}    JCI Corporate General Account
@{cat1}           Controls and Accessories    Indoor Units    Multi Zone    Outdoor Units/Outdoor Mini VRF    Single Zone
${subcat}         \    # empty

*** Test Cases ***
reg_loginstore
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
loginSFDC
    Open Browser    https://test.salesforce.com    gc
    Maximize Browser Window
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
    Click Element    xpath://*[@id='workWithPortalMenu']//a[@name='networklogin'][contains(text(),'Log in to Community as User')]
    sleep    3s
    Select From List    xpath://select[@id='portalUserLoginAsSelect']    Order Navigator
    Click Element    xpath://div[@id='loginAsPortalUserOverlayDialog']//div[@class='middle']//input[1]
    Click Element    xpath://a[contains(text(),'Ducted Residential & Commercial Systems, Ductless')]
