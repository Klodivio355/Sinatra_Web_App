
Feature: Login
    
    Scenario: correct login userDetails
        Given I am on the login page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form"
        Then I should see "You are logged in"
        
    Scenario: correct login userDetails
        Given I am on the login page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form"
        Then I should not be on the login page
        
    Scenario: incorrect login userDetails
        Given I am on the login page
        When I fill in "useremail" with "nonsense"
        When I fill in "password" with "wrong password"
        When I press "Login" within "form"
        Then I should be on the login page
        Then I should see "Wrong email or password, please try again."
        
    Scenario: Correct email, but wrong password
        Given I am on the login page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "wrong password"
        When I press "Login" within "form"
        Then I should see "Wrong email or password, please try again."
        
    Scenario: Trying to access login page while already logged in
        Given I am on the login page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form"
        Given I am on the home page
        When I go to the login page
        Then I should be on the home page
    
    Scenario: Go to homepage without account    
        Given I am on the login page
        When I follow "Home without Login"
        Then I should be on the home page
       
    Scenario: Go to the register page 
        Given I am on the login page
        When I follow "Register"
        Then I should be on the register page
