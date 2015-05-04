Feature: User edits profile

  As a registered student
  I want to edit my own profile
  In order to keep the service relevant to my needs

  As a registered student
  I can't change another person's profile
  In order to maintain the service's integrity

  As an unregistered user
  I can't edit a user's profile
  In order to maintain the service's integrity

  Scenario: Edit own profile
    Given that I am logged in as "Cody" "Poll" with email "CJPoll@gmail.com"
    When I visit profile "Cody" "Poll"
    And I press "Edit Profile"
    And I change my name to "John" "Nash"
    Then I should be on profile "John" "Nash"

  Scenario: Can't edit another's profile
    Given that I am logged in as "Cody" "Poll" with email "CJPoll@gmail.com"
    And there is a user named "John" "Nash"
    When I visit profile "John" "Nash"
    Then there should be no edit button

  Scenario: Can't jump to edit person's profile
    Given that I am logged in as "Cody" "Poll" with email "CJPoll@gmail.com"
    And there is a user named "John" "Nash"
    When I jump to edit profile "John" "Nash"
    Then the server should respond with a security violation

  Scenario: Unregistered user can't jump to edit profile
    Given that I am not logged in
    And there is a user named "John" "Nash"
    When I jump to edit profile "John" "Nash"
    Then I should be instructed to sign in
