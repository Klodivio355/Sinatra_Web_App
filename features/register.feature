Feature: register
    
    
    #aftet reapir the register function of repeated account
    #It will return true once only because of repeated function
    
    Scenario: creating an accounts
        Given I am on the register page
        When I fill in "userhandle" with "test03@qq.com"
        When I fill in "email" with "test103@qq.com"
        When I fill in "password" with "123123"
        When I fill in "repeat_password" with "123123"
        When I press "submit" within "form"
        Then I should see "Login"
   
   #Form input return form first then go onclick function
   
   Scenario: logger button which return the form first
        Given I am on the register page
        When I press "login page" within "form"
        Then I should be on "the register page" page
        
        