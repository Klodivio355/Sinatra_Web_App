Feature: Header
    
    #Different nav buttons (accountInfo) after login
    Scenario: Header of Homepage after Login
        Given I am on the login page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form"
        Then I should see "Account Info"
    
    #Account Home button
    Scenario: header link from Homepage to homepage
        Given I am on the home page
        When I follow "Home"
        Then I should see "Booking Instructions"
    
    #Account Info button
    Scenario: header link from Homepage to accountInformation
        Given I am on the login page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form"
        When I follow "Account Info"
        Then the "email" field within "form" should contain "test10@qq.com"
        Then the "password" field within "form" should contain "123123"
    
    #Log Out button
    Scenario: Header of Log out after Login
        Given I am on the login page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form"
        When I follow "Log Out"
        Then I should see "Login"
    
    #Login button
    Scenario: Header of Login
        Given I am on the home page
        When I follow "Login"
        Then I should see "Login"
        
    #Contact us button
    Scenario: Header of Contact Us
        Given I am on the home page
        When I follow "Contact Us"
        Then I should see "Help us"    