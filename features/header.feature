Feature: Header
    
    #Different nav buttons (accountInfo) after login
    Scenario: Header of Homepage after Login
        Given I am on the login page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form" 
        Then I should see "Home"
        Then I should see "Account Info"
        Then I should see "Contact Us"
    
    #Account Home button
    Scenario: Home link from any other page
        Given I am on the home page
        When I follow "Contact Us"
        When I follow "Home"
        Then I should see "Booking Instructions"
    
    #Account Info button
    Scenario: Link from Homepage to account information
        Given I am on the login page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form"
        When I follow "Account Info"
        Then the "email" field within "form" should contain "test10@qq.com"
        Then the "password" field within "form" should contain "123123"
    
    #Log Out button
    Scenario: Log out link on header after logging in
        Given I am on the login page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form"
        When I follow "Log Out"
        Then I should see "Login"
    
    #Login button
    Scenario: Login link on Header
        Given I am on the home page
        When I follow "Login"
        Then I should see "Login"
        
    #Contact us button
    Scenario: Contact Us link on Header
        Given I am on the home page
        When I follow "Contact Us"
        Then I should see "Help us"    