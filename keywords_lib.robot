*** Keywords ***
loginSFDC
    [Arguments]    ${browser}    ${username}
    Open Browser    ${URL}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    20s
    Input Text    css:input#username    ${username}
    Input Password    css:input#password    ${password}
    Wait Until Element Is Enabled    css:input#Login    timeout=20s
    Click Button    css:input#Login

loginStorefront
    [Arguments]    ${storefront}    ${user_contact}    ${alphabet}
    Wait Until Element Is Visible    xpath://input[@id='phSearchInput']
    Input Text    xpath://input[@id='phSearchInput']    ${account_type}
    Click Button    css:div#searchButtonContainer>input
    Click Element    xpath://div[@id='Account_body']//a[contains(text(),'JCI Corporate General Account')]
    Click Element    xpath://*[@id="001G000001zNoUG_RelatedContactList_body"]/div/a[2]
    Click Link    ${alphabet}
    Click Link    ${user_contact}
    Scroll Element Into View    xpath://input[@name='new00NG000000FQZUq']
    Wait Until Element Is Visible    xpath://span[@id='workWithPortalCopyLabel']    timeout=20s
    Click Element    xpath://span[@id='workWithPortalCopyLabel']
    Wait Until Element Is Visible    xpath://div[@id='workWithPortalCopyMenu']//a[@name='networklogin'][contains(text(),'Log in to Community as User')]    timeout=20s
    Click Element    xpath://div[@id='workWithPortalCopyMenu']//a[@name='networklogin'][contains(text(),'Log in to Community as User')]
    sleep    3s
    Select From List By Label    xpath://select[@id='portalUserLoginAsSelect']    Order Navigator
    Click Element    xpath://div[@id='loginAsPortalUserOverlayDialog']//div[@class='middle']//input[1]
    sleep    5s
    Click Link    ${storefront}

loopFOR
    [Arguments]    ${element}    ${locator}    @{cat}
    : FOR    ${subcat}    IN    @{cat}
    \    Wait Until Element Is Visible    xpath:${element}    timeout=20s
    \    Log    clicking ${subcat}
    \    Click Element    xpath:${element}
    \    retry_element    xpath:${element}
    \    Sleep    5s
    \    Click Link    ${subcat}
    \    Sleep    2s
    \    Wait Until Element Is Visible    xpath://button[@id='cc_sort_name_dropdown']    timeout=20s
    \    js_script    (0,400)
    \    plp_check    ${locator}    ${subcat}
    \    Sleep    10s
    \    Capture Page Screenshot

js_script
    [Arguments]    ${scrolldown}
    Execute Javascript    window.scrollBy${scrolldown};
    log    scrolled

plp_check
    [Arguments]    ${locator}    ${subcat}    # locator xpath or css
    ${element_present}=    Run Keyword And Return Status    Element Should Be Visible    ${locator}
    Run Keyword If    ${element_present}    log    ${subcat}: PLP is not working

loopThroughCats
    [Arguments]    ${scrolldown}    ${locator}
    : FOR    ${tab}    IN    @{controls_cat}
    \    sleep    5s
    \    Click Link    ${tab}
    \    retry_error    ${tab}
    \    Sleep    10s
    \    Wait Until Element Is Enabled    xpath://button[@id='cc_sort_name_dropdown']    timeout=20s    error=unknown error
    \    js_script    ${scrolldown}
    \    plp_check    ${locator}    ${tab}
    \    Capture Page Screenshot

Login to Chiller Store
    loginStorefront    York Genuine Parts Store

Check each category on store
    loopFOR    ${ch_id0}    ${locator_plp_upg}    @{ch_cat0}
    loopFOR    ${ch_id1}    ${locator_plp_upg}    @{ch_cat1}
    loopFOR    ${ch_id2}    ${locator_plp_upg}    @{ch_cat2}
    loopFOR    ${ch_id3}    ${locator_plp_upg}    @{ch_cat3}
    loopFOR    ${ch_id4}    ${locator_plp_upg}    @{ch_cat4}
    loopFOR    ${ch_id5}    ${locator_plp_upg}    @{ch_cat5}
    loopFOR    ${ch_id6}    ${locator_plp_upg}    @{ch_cat6}
    loopFOR    ${ch_id7}    ${locator_plp_upg}    @{ch_cat7}
    loopFOR    ${ch_id8}    ${locator_plp_upg}    @{ch_cat8}

retry_error
    [Arguments]    ${link}
    ${error_retry}=    Run Keyword And Ignore Error    Click Link    ${link}
    Run Keyword If    ${error_retry}    Wait Until Keyword Succeeds    5x    10s    Click Link    ${link}
    Continue For Loop If    ${error_retry}='FAIL'

retry_element
    [Arguments]    ${link}
    ${error_retry}=    Run Keyword And Ignore Error    Click Element    ${link}
    Run Keyword If    ${error_retry}    Wait Until Keyword Succeeds    5x    10s    Click Element    ${link}
    Continue For Loop If    ${error_retry}='FAIL'

Reorder_cart
    [Arguments]    ${orderid}    # pass orderid
    Click Link    Order History
    Wait Until Element Is Visible    css:#searchOrderInput    timeout=60s
    Input Text    css:#searchOrderInput    ${orderid}
    Click Element    css:div.cc_order_search_action>input
    Wait Until Element Is Visible    css:ul.orderbtnlist li:nth-of-type(1)    timeout=20s
    Sleep    10s
    Click Element    xpath://ul[@class="orderbtnlist"]/li/input[@value="Reorder"]
    Wait Until Page Contains    Shopping Cart    timeout=60s
    Wait Until Element Is Visible    xpath://button[@class="btn btn-default btn-sm checkOutBtn cc_checkout_btn pull-right"]    timeout=20s
    Sleep    5s
    Click Element    xpath://button[@class="btn btn-default btn-sm checkOutBtn cc_checkout_btn pull-right"]

checkout_process
    Wait Until Page Contains    Contact Information    timeout=60s
    Click Link    Use Billing Address
    Input Text    name:shippingAddress.attention_Phone    123-466-7896
    wait Until Element Is Visible    xpath:/html[1]/body[1]/div[1]/div[2]/div[1]/div[1]/form[3]/fieldset[1]/div[6]/div[1]/div[1]/input[2]    timeout=20s
    Click Element    xpath:/html[1]/body[1]/div[1]/div[2]/div[1]/div[1]/form[3]/fieldset[1]/div[6]/div[1]/div[1]/input[2]
    wait Until Element Is Visible    xpath:/html[1]/body[1]/div[1]/div[2]/div[1]/div[1]/div[9]/div[2]/div[1]/input[2]    timeout=20s
    Click Element    xpath:/html[1]/body[1]/div[1]/div[2]/div[1]/div[1]/div[9]/div[2]/div[1]/input[2]
    Sleep    5s
    wait Until Element Is Visible    xpath://input[@id='selContinuebtn']    timeout=20s
    Click Element    xpath://input[@id='selContinuebtn']
    Wait Until Page Contains    Shipment Information    timeout=20s
    Select From List By Value    css:#FreightTerms    Z01 – Standard Freight Charges
    Click Element    xpath://input[@value="Continue"]
    Wait Until Page Contains    Order Review    timeout=20s
    Click Element    xpath://input[@class="button right proceed processReview"]
    Wait Until Page Contains    Purchase Order    timeout=20s
    Input Text    id:poText    125634
    Input Text    name:subAccountNumber    Robot
    Click Element    xpath://input[@value="Process Payment"]
    Alert Should Be Present
    Sleep    15s
    Capture Page Screenshot

orders_inloop
    [Arguments]    @{orderids-uat}
    : FOR    ${ORDER}    IN    @{orderids-uat}
    \    Page Should Contain    Order History    DEBUG
    \    Sleep    10s
    \    Reorder_cart    ${ORDER}
    \    checkout_process
