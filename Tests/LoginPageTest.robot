*** Settings ***
Documentation   To validate CPaaS login page
Library         SeleniumLibrary
Suite Setup     Test Start
Test Teardown   Test Stop
Suite Teardown  Close Browser
Resource        ../Resources/Keywords/LoginPage.robot
Resource        ../Resources/Keywords/HomePage.robot

*** Test Cases ***

CPaaS.LoginPage.TC_001
    [Documentation]     Login page - To verify whether sign in page throw an error message, if user enters the invalid email id and valid password.
    [Tags]  AG-825      Functional
    LoginPage.fill the login form       ${invalid_username}      ${valid_password}
    wait until it checks and displays error message
    verify error message for invalid user

CPaaS.LoginPage.TC_002
    [Documentation]     Login page - To verify whether sign in page throw an error message, if user enters the valid email id and invalid password.
    [Tags]  AG-826      Functional
    LoginPage.fill the login form       ${valid_username}      ${invalid_password}
    wait until it checks and displays error message
    verify error message for invalid password

CPaaS.LoginPage.TC_003
    [Documentation]     Login page - To verify whether sign in page throw an error message, if user enters the invalid email id and invalid password.
    [Tags]  AG-827      Functional
    LoginPage.fill the login form       ${invalid_username}      ${invalid_password}
    wait until it checks and displays error message
    verify error message for invalid user

CPaaS.LoginPage.TC_004
    [Documentation]     Login page - To verify whether user is able to sign in the page, if user enters the valid email id and valid password.
    [Tags]  AG-828      Critical
    Launch the application
    LoginPage.fill the login form       ${valid_username}      ${new_password}
    #LoginPage.accept to join the account
    HomePage.wait until it launches home page
    #HomePage.verify home page

#CPaaS.LoginPage.TC_005
#    [Documentation]     Login page - Verify thr forgot password functionality
#    [Tags]  AG-829
#    LoginPage.verify forgot password functionality

CPaaS.LoginPage.TC_006
    [Documentation]     Login page - Verify if a user is able to login with a new password only after user has changed the password.
    [Tags]  AG-830      Sanity
    Launch the application
    LoginPage.fill the login form       ${valid_username}      ${valid_password}
    change the existing password
    Launch the application
    LoginPage.fill the login form       ${valid_username}      ${new_password}
    HomePage.wait until it launches home page