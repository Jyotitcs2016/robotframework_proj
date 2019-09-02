*** Settings ***
Suite Setup       loginSFDC    gc
Suite Teardown    Close All Browsers
Library           SeleniumLibrary
Resource          ${CURDIR}/locators_file.robot

*** Variables ***

*** Test Cases ***
reg_categorycheck_UPG
    [Documentation]    Step1 -As a user logged in to UPG store
    ...    Step2-User click on Catagory trees one by one
    ...    Step3-User click on each Filters for PLP list items one by one
    [Tags]    UPG
    loginStorefront    Ducted Residential & Commercial Systems, Ductless Systems & Source 1 Parts Store
    Sleep    5s
    loopFOR    ${element1}    @{cat1}
    loopFOR    ${element2}    @{cat2}
    loopFOR    ${element3}    @{cat3}
    loopFOR    ${element4}    @{cat4}

reg_categorycheck_Controls
    [Documentation]    Step1 -As a user logged in to Controls store
    ...    Step2-User click on Catagory trees one by one
    ...    Step3-User click on each Filters for PLP list items one by one
    [Tags]    controls
    loginStorefront    Controls Parts Store
    Sleep    2s
    loopThroughCats    (0,2500)

js_use
    ${Get Vertical Position}    Get Vertical Position    xpath://img[@id='01aG0000001OjLJImg']
    ${Get horizontal Position}    Get Horizontal Position    xpath://img[@id='01aG0000001OjLJImg']
    Log    vertical ${Get Vertical Position} pixels,horizon ${Get horizontal Position} pixels
    js_script
    sleep    5s

*** Keywords ***
loginSFDC
    [Arguments]    ${browser}
    Open Browser    ${URL}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    20s
    Input Text    css:input#username    ${username}
    Input Password    css:input#password    ${password}
    Wait Until Element Is Enabled    css:input#Login
    Click Button    css:input#Login

loginStorefront
    [Arguments]    ${storefront}
    Wait Until Element Is Visible    xpath://input[@id='phSearchInput']
    Input Text    xpath://input[@id='phSearchInput']    ${account_type}
    Click Button    css:div#searchButtonContainer>input
    Click Element    xpath://div[@id='Account_body']//a[contains(text(),'JCI Corporate General Account')]
    Click Element    xpath://*[@id="001G000001zNoUG_RelatedContactList_body"]/div/a[2]
    Click Element    xpath://div[@class='listElementBottomNav']//span[@class='listItemPad'][contains(text(),'C')]
    Click Element    xpath://a[contains(text(),'Clarey, Spencer')]
    Scroll Element Into View    xpath://input[@name='new00NG000000FQZUq']
    Wait Until Element Is Visible    xpath://span[@id='workWithPortalCopyLabel']
    Click Element    xpath://span[@id='workWithPortalCopyLabel']
    Wait Until Element Is Visible    xpath://div[@id='workWithPortalCopyMenu']//a[@name='networklogin'][contains(text(),'Log in to Community as User')]
    Click Element    xpath://div[@id='workWithPortalCopyMenu']//a[@name='networklogin'][contains(text(),'Log in to Community as User')]
    sleep    3s
    Select From List By Label    xpath://select[@id='portalUserLoginAsSelect']    Order Navigator
    Click Element    xpath://div[@id='loginAsPortalUserOverlayDialog']//div[@class='middle']//input[1]
    sleep    5s
    Click Link    ${storefront}

loopFOR
    [Arguments]    ${element}    @{cat}
    : FOR    ${subcat}    IN    @{cat}
    \    Log    clicking ${subcat}
    \    Click Element    xpath:${element}
    \    Sleep    5s
    \    Click Link    ${subcat}
    \    Sleep    2s
    \    Wait Until Element Is Visible    xpath://button[@id='cc_sort_name_dropdown']
    \    js_script    (0,500)
    \    Sleep    10s
    \    Capture Page Screenshot

js_script
    [Arguments]    ${scrolldown}
    Execute Javascript    window.scrollBy${scrolldown};
    log    scrolled

js_plp_check
    ${var}=    Execute Javascript    ${CURDIR}/plp_check.js
    \    [Return]    ${var}

loopThroughCats
    [Arguments]    ${scrolldown}
    : FOR    ${tab}    IN    @{controls_cat}
    \    sleep    5s
    \    Click Link    ${tab}
    \    Sleep    5s
    \    Wait Until Element Is Enabled    xpath://button[@id='cc_sort_name_dropdown']    timeout=20s    error=unknown error
    \    js_script    ${scrolldown}
    \    Capture Page Screenshot
