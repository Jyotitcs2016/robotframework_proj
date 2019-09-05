*** Keywords ***
loginSFDC
    [Arguments]    ${browser}    ${username}
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
    \    js_script    (0,400)
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
