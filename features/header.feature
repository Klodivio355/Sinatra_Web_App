Feature: Header
    
    Scenario: Header of Homepage after Login
        Given I am on the home page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form"
        Then I should see "Account Info"
        
    Scenario: header link from Homepage to homepage
        Given I am on the real home page
        When I follow "Home"
        Then I should see "Booking Instructions"
        
    Scenario: header link from Homepage to accountInformation
        Given I am on the home page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form"
        When I follow "Account Info"
        Then I should see "Account Details"
