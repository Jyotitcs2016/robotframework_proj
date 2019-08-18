*** Settings ***
Suite Setup       loginSFDC
Suite Teardown    Close All Browsers
Library           SeleniumLibrary

*** Test Cases ***
reg_loginstore
    Element Text Should Be    css:h1.currentStatusUserName>a    JyotiPrakash Panda
    Input Text    css:input#phSearchInput    Spencer Clarey
    Click Button    css:div#searchButtonContainer>input
    Click Element    css:body.hasMotif.setupTab.searchResults.UnifiedSearchResults.ext-webkit.ext-chrome.net-withGlobalHeader.sfdcBody.brandQuaternaryBgr:nth-child(4) div.bodyDiv.brdPalette.brandPrimaryBrd:nth-child(3) table.outerNoSidebar td.noSidebarCell table.outer:nth-child(4) td.searchResultsCell div.individualPalette div.list1:nth-child(3) div.bRelatedList div.listRelatedObject.contactBlock:nth-child(3) div.bPageBlock.brandSecondaryBrd.secondaryPalette div.pbBody table.list tbody:nth-child(1) tr.dataRow.even.first:nth-child(2) td.dataCell:nth-child(5) > a:nth-child(1)
    Click Element    css:div.pShowMore a:contains("Go to list (55+) »")

*** Keywords ***
loginSFDC
    Open Browser    https://test.salesforce.com    gc
    Input Text    css:input#username    jyotiprakash.panda-ext@jci.com
    Input Password    css:input#password    Jyoti@1995
    Click Button    css:input#Login
