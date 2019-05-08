Feature: Admin_TWO

    Scenario: Accessing admin page
        Given I am on the login page
        When I fill in "useremail" with "admin@gmail.com"
        When I fill in "password" with "admin123"
        When I press "Login" within "form"
        Given I am on the home page
        When I follow "Database Updates"
        Then I should see "Database Updates"
