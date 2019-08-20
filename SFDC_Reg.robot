*** Settings ***
Suite Setup       loginSFDC
Suite Teardown    Close All Browsers
Library           SeleniumLibrary

*** Variables ***
${account_type}    JCI Corporate General Account

*** Test Cases ***
reg_loginstore
    Element Text Should Be    css:h1.currentStatusUserName>a    JyotiPrakash Panda
    Input Text    css:input#phSearchInput    ${account_type}
    Click Button    css:div#searchButtonContainer>input
    Click Element    xpath://div[@id='Account_body']//a[contains(text(),'JCI Corporate General Account')]
    Click Element    xpath://*[@id="001G000001zNoUG_RelatedContactList_body"]/div/a[2]
    Click Element    xpath://div[@class='listElementBottomNav']//span[@class='listItemPad'][contains(text(),'C')]
    Click Element    xpath://a[contains(text(),'Clarey, Spencer')]
    Click Element    xpath://div[@id='workWithPortalButton']
    Click Element    xpath://div[@id='workWithPortalMenu']//a[@name='networklogin'][contains(text(),'Log in to Community as User')]
    Select From List    xpath://select[@id='portalUserLoginAsSelect']    Order Navigator
    Click Element    xpath://div[@id='loginAsPortalUserOverlayDialog']//div[@class='middle']//input[1]
    Click Element    xpath://a[contains(text(),'Ducted Residential & Commercial Systems, Ductless')]

*** Keywords ***
loginSFDC
    Open Browser    https://test.salesforce.com    gc
    Input Text    css:input#username    jyotiprakash.panda-ext@jci.com
    Input Password    css:input#password    Jyoti@1995
    Click Button    css:input#Login
