*** Settings ***
Documentation     SFDC Regression
Suite Setup       loginSFDC    gc    ${username}
Suite Teardown    Close All Browsers
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
    loopThroughCats    (0,1500)

js_use
    ${Get Vertical Position}    Get Vertical Position    xpath://img[@id='01aG0000001OjLJImg']
    ${Get horizontal Position}    Get Horizontal Position    xpath://img[@id='01aG0000001OjLJImg']
    Log    vertical ${Get Vertical Position} pixels,horizon ${Get horizontal Position} pixels
    js_script    (0,1500)
    sleep    5s

*** Keywords ***
