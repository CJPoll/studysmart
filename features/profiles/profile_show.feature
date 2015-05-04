Feature: User views profile
  As a registered student
  I want to view a tutor's profile
  To determine whether or not to hire the tutor

  As a registered student
  I want to view another student's profile
  To determine whether or not to invite her to a study group

  Scenario: Not blocked, viewing student
    Given that I am logged in as "Cody" "Poll" with email "CJPoll@gmail.com"
    And there is a user named "Ariana" "Rodriguez"
    When I visit profile "Ariana" "Rodriguez"
    Then I should see "Ariana" "Rodriguez" profile

  Scenario: Not blocked, logged out redirects to login
    Given that I am not logged in
    And there is a user named "Ariana" "Rodriguez"
    When I visit profile "Ariana" "Rodriguez"
    Then I should be on "/users/sign_in"
