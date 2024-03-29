*** Settings ***
Suite Setup       loginSFDC    ${browser}    ${userid_uat}
Default Tags      base
Library           SeleniumLibrary
Resource          ${CURDIR}/locators_file.robot
Resource          ${CURDIR}/keywords_lib.robot

*** Variables ***

*** Test Cases ***
reg_categorycheck_UPG_UAT
    [Documentation]    Step1 -As a user logged in to UPG store
    ...    Step2-User click on Catagory trees one by one
    ...    Step3-User click on each Filters for PLP list items one by one
    [Tags]    UPG    uat
    loginStorefront    Ducted Residential & Commercial Systems, Ductless Systems & Source 1 Parts Store
    Sleep    5s
    loopFOR    ${element1}    ${locator_plp_upg}    @{cat1}
    loopFOR    ${element2}    ${locator_plp_upg}    @{cat2}
    loopFOR    ${element3}    ${locator_plp_upg}    @{cat3}
    loopFOR    ${element4}    ${locator_plp_upg}    @{cat4}
    [Teardown]    Close Browser

*** Keywords ***
