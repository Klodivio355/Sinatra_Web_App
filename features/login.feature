
Feature: Login
    
    Scenario: correct login userDetails
        Given I am on the login page
        When I fill in "useremail" with "test10@qq.com"
        When I fill in "password" with "123123"
        When I press "Login" within "form"
        Then I should see "You are logged in"
    
    Scenario: incorrect login userDetails
        Given I am on the login page
        When I fill in "useremail" with "nosense"
        When I fill in "password" with "nop"
        When I press "Login" within "form"
        Then I should see "Login"


    #both of them lack a way to check the link of buttom
    
    #Scenario: Go to homepage without account    
    #    Given I am on the home page
    #    When I press "Home without Login" within "section"
    #    Then I should be on "the home page" page
    
    
    
    
    #Scenario: Go to register page 
