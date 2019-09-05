*** Settings ***
Suite Setup       loginSFDC    gc    ${userid_uat}
Suite Teardown    Close All Browsers
Default Tags      base
Library           SeleniumLibrary
Resource          ${CURDIR}/locators_file.robot
Resource          ${CURDIR}/keywords_lib.robot

*** Variables ***
${password}       Jyoti@1995
${name}           Jyoti Prakash
${URL}            https://test.salesforce.com

*** Test Cases ***
reg_categorycheck_UPG_UAT
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

*** Keywords ***
