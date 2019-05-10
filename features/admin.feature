Feature: Admin

    Scenario: Logging in with Manchester admin details
        Given I am on the login page
        When I fill in "useremail" with "manadmin@gmail.com"
        When I fill in "password" with "man123"
        When I press "Login" within "form"
        Then I should see "Administrator"
        Then I should see "Database Updates"
        
    Scenario: Logging in with superadmin details
        Given I am on the login page
        When I fill in "useremail" with "admin@gmail.com"
        When I fill in "password" with "admin123"
        When I press "Login" within "form"
        Then I should see "Administrator"
        Then I should see "Database Updates"
        
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
        
    Scenario: Correct admin email, but wrong password
        Given I am on the login page
        When I fill in "useremail" with "admin@gmail.com"
        When I fill in "password" with "wrong password"
        When I press "Login" within "form"
        Then I should be on the login page
        Then I should see "Wrong email or password, please try again."
        
    Scenario: Admin searching for relevant tweets
        Given I am on the login page
        When I fill in "useremail" with "admin@gmail.com"
        When I fill in "password" with "admin123"
        When I press "Login" within "form"
        Given I am on the admin page
        When I fill in "search" with "ise19team07"
        When I press "Update"
        Then I should see "@ise19team07"
        
    Scenario: Manchester Admin auto search button
        Given I am on the login page
        When I fill in "useremail" with "manadmin@gmail.com"
        When I fill in "password" with "man123"
        When I press "Login" within "form"
        Given I am on the admin page
        Then I should see "Manchester"
        When I press "Manchester"
        Then I should see "#TaxisInManchester"
        
        
    Scenario: Admin booking form save
        Given I am on the login page
        When I fill in "useremail" with "admin@gmail.com"
        When I fill in "password" with "admin123"
        When I press "Login" within "form"
        Given I am on the admin page
        When I fill in "handleIn" with "user1"
        When I fill in "regIn" with "DE1 UX3"
        When I fill in "startTimeIn" with "01:00"
        When I fill in "dateIn" with "2019-03-22"
        When I fill in "startPosIn" with "here"
        When I fill in "endPosIn" with "there"
        When I press "Save Booking"
        Then I should see "Details saved, awaiting completion."
        Then I should see "Busy"