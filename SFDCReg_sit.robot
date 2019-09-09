*** Settings ***
Documentation     SFDC Regression
Suite Setup       loginSFDC    ${browser}    ${username}
Library           SeleniumLibrary
Resource          ${CURDIR}/locators_file.robot
Resource          ${CURDIR}/keywords_lib.robot

*** Variables ***

*** Test Cases ***
reg_categorycheck_UPG
    [Documentation]    Step1 -As a user logged in to UPG store
    ...    Step2-User click on Catagory trees one by one
    ...    Step3-User click on each Filters for PLP list items one by one
    [Tags]    UPG
    [Setup]    Screenshot.Set Screenshot Directory    ${CURDIR}/screenshots    # screenshot dir
    loginStorefront    Ducted Residential & Commercial Systems, Ductless Systems & Source 1 Parts Store
    Sleep    5s
    loopFOR    ${element1}    ${locator_plp_upg}    @{cat1}
    loopFOR    ${element2}    ${locator_plp_upg}    @{cat2}
    loopFOR    ${element3}    ${locator_plp_upg}    @{cat3}
    loopFOR    ${element4}    ${locator_plp_upg}    @{cat4}
    [Teardown]    Close Browser

reg_categorycheck_Controls
    [Documentation]    Step1 -As a user logged in to Controls store
    ...    Step2-User click on Catagory trees one by one
    ...    Step3-User click on each Filters for PLP list items one by one
    [Tags]    controls
    loginStorefront    Controls Parts Store
    Sleep    2s
    loopThroughCats    (0,2000)    ${locator_plp_upg}
    [Teardown]    Close Browser

js_use
    ${Get Vertical Position}    Get Vertical Position    xpath://img[@id='01aG0000001OjLJImg']
    ${Get horizontal Position}    Get Horizontal Position    xpath://img[@id='01aG0000001OjLJImg']
    Log    vertical ${Get Vertical Position} pixels,horizon ${Get horizontal Position} pixels
    js_script    (0,1500)
    sleep    5s
    Screenshot.Set Screenshot Directory
    [Teardown]    Close Browser

reg_categorycheck_Chiller
    [Tags]    Chiller
    Login to Chiller Store
    Wait Until Element Is Visible    xpath://img[@class='logoUrlDesktop']    timeout=20s
    Check each category on store
    [Teardown]    Close Browser

*** Keywords ***
