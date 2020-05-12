*** Settings ***
Library    SeleniumLibrary
Library    Dialogs

*** Variables ***
${HOST}             http://${SERVER}
${SERVER}           localhost:7272
${VALID_USERNAME}   demo
${VALID_PASSWORD}   mode
${WELCOME_TITLE}    Welcome Page
${LOGIN_PAGE}       Login Page
${ERROR_PAGE}       Error Page
${BROWSER}          chrome

*** Keywords ***
Open Browser to login page
  Open browser    ${HOST}   ${BROWSER}

Enter username
  [Arguments]    ${username}
  Input text   xpath=//*[@id="username_field"]     ${username}

Enter password
  [Arguments]    ${password}
  Input password   xpath=//*[@id="password_field"]    ${password}

Log In
  Click button    LOGIN

Welcome page should be Open
  Title should be    ${WELCOME_TITLE}

Error page should be Open
  Title should be    Error Page

Login page should be Open
  Title should be   ${LOGIN_PAGE}

Go to login page
  Go to    ${HOST}


