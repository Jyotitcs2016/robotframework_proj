*** Settings ***
Suite Setup       loginSFDC    ie
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
${outputdir}      C://Users//JPP//Documents//Testing//Robot//screenshots//
@{controls_cat}    Actuators    Air Flow Level Switches    Air Quality Sensors    Airflow Measuring Stations    Current Switches and Relays    Dampers    Empty Enclosures
...               Engines & Controllers    Lighting Control Panels    Power Devices    Pressure Sensors    Pressure Switches    Refrigeration Controls    Room Pressure Monitors
...               Security Devices    Standard Panels    Starters    Temperature and Humidity Sensors    Temperature Switches    Thermostats    Valves
...               Variable Speed Drives    Verasys Controls    Water Flow Sensors    Miscellaneous    # All catagories of Controls store

*** Test Cases ***
reg_categorycheck_UPG
    [Tags]    UPG
    loginStorefront    Ducted Residential & Commercial Systems, Ductless Systems & Source 1 Parts Store
    Sleep    5s
    loopFOR    ${element1}    @{cat1}
    loopFOR    ${element2}    @{cat2}
    loopFOR    ${element3}    @{cat3}
    loopFOR    ${element4}    @{cat4}

reg_categorycheck_Controls
    [Tags]    controls
    loginStorefront    Controls Parts Store
    Sleep    2s
    : FOR    ${tab}    IN    @{controls_cat}
    \    Wait Until Element Is Enabled    ${tab}    timeout=none
    \    Click Link    ${tab}
    \    Scroll Element Into View    xpath://input[@id='viewcartbutton']
    \    Capture Page Screenshot

*** Keywords ***
loginSFDC
    [Arguments]    ${browser}
    Open Browser    https://test.salesforce.com    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    20s
    Input Text    css:input#username    jyotiprakash.panda-ext@jci.com
    Input Password    css:input#password    Jyoti@1995
    Wait Until Element Is Enabled    css:input#Login
    Click Button    css:input#Login

loginStorefront
    [Arguments]    ${storefront}
    Wait Until Element Is Visible    css:input#phSearchInput
    Input Text    css:input#phSearchInput    ${account_type}
    Click Button    css:div#searchButtonContainer>input
    Click Element    xpath://div[@id='Account_body']//a[contains(text(),'JCI Corporate General Account')]
    Click Element    xpath://*[@id="001G000001zNoUG_RelatedContactList_body"]/div/a[2]
    Click Element    xpath://div[@class='listElementBottomNav']//span[@class='listItemPad'][contains(text(),'C')]
    Click Element    xpath://a[contains(text(),'Clarey, Spencer')]
    Sleep    2s
    Click Element    id:workWithPortalButton
    Sleep    2s
    Click Link    Log in to Community as User
    sleep    3s
    Select From List By Label    xpath://select[@id='portalUserLoginAsSelect']    Order Navigator
    Click Element    xpath://div[@id='loginAsPortalUserOverlayDialog']//div[@class='middle']//input[1]
    Click Link    ${storefront}

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
