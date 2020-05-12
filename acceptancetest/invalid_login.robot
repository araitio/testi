*** Settings ***
Resource    resource.robot
Suite Setup   Open Browser to login page
Suite Teardown    Close Browser
Test Setup    Login page should be open
Test Teardown    Go to login page
Test Template    Invalid login

*** Test Cases ***
Invalid username and password     jaska                jokunen
  [Tags]    smoke
Invalid username                  jaska                ${VALID_PASSWORD}
Invalid password                  ${VALID_USERNAME}    jokunen
Empty username and password       ${EMPTY}             ${EMPTY}
Empty username                    ${EMPTY}             ${VALID_PASSWORD}
Empty password                    ${VALID_USERNAME}    ${EMPTY}

*** Keywords ***
Invalid login
  [Arguments]    ${username}    ${password}
  Enter username   ${username}
  Enter password   ${password}
  Pause execution
  Log In
  Error page should be Open 