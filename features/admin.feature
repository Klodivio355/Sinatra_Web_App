Feature: Admin

    Scenario: Logging in with admin details
        Given I am on the login page
        When I fill in "useremail" with "admin@gmail.com"
        When I fill in "password" with "admin123"
        When I press "Login" within "form"
        Then I should see "Administrator"
    
    Scenario: Accessing admin page
        Given I am on the login page
        When I fill in "useremail" with "admin@gmail.com"
        When I fill in "password" with "admin123"
        When I press "Login" within "form"
        Given I am on the home page
        When I follow "Administrator"
        Then I should see "Administrator System"
        
    Scenario: Attempting admin access without proper credentials
        Given I am on the login page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form"
        Then I should not see "Administrator"   
        
    #To be added
    #Scenario: Admin functionality
        #Given I am on the admin page
        #When I fill in "search" with "twitter"
        #When I press "Update" within "form"
        #Then I should see "ise19team07"
        