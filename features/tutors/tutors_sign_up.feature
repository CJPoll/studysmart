Feature: Student signs up for a tutor
  As a student
  I want to request a tutoring session from a tutor
  So that I can get help with my coursework

  As a tutor
  I want to accept a tutoring request from a student
  So that I can get paid for my services

  Scenario: Student requests a tutoring session
    Given that I am logged in as "Cody" "Poll" with email "cpoll@university.com"
    And I take "Computer Science 101" at "BYU-Idaho"
    And a tutor named "John" "Nash" with email "jnash@university.com" tutors "Computer Science 101" at "BYU-Idaho"
    When I view tutors at "BYU-Idaho" for "Computer Science 101"
    Then I should see "John" "Nash"

    When I request a tutoring session from "John" "Nash"
    Then there should be a success notification

  Scenario: Tutor accepts tutoring session request
    Given that I am logged in as "Cody" "Poll" with email "cpoll@university.com"
    And "Cody" "Poll" tutors "Computer Science 101" at "BYU-Idaho"
    And there is a user named "John" "Nash"
    And "John" "Nash" takes "Computer Science 101" at "BYU-Idaho"
    And "John" "Nash" has requested tutoring from "Cody" "Poll" for "Computer Science 101" at "BYU-Idaho"
    When I view my notifications
    And I accept the tutoring request from "John" "Nash"
    Then there should be a success notification
