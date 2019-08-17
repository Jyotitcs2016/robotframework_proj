*** Settings ***
Suite Setup       loginSFDC
Suite Teardown    Close All Browsers
Library           SeleniumLibrary

*** Test Cases ***
reg_loginstore
    Element Text Should Be    css:h1.currentStatusUserName>a    JyotiPrakash Panda

*** Keywords ***
loginSFDC
    Open Browser    https://test.salesforce.com    gc
    Input Text    css:input#username    jyotiprakash.panda-ext@jci.com
    Input Password    css:input#password    Jyoti@1995
    Click Button    css:input#Login
