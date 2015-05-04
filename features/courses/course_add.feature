Feature: Add a course
  As a tutor
  I want to add a course to my profile
  So I can be found by students looking for a tutor

  As a student
  I want to add a course to my profile
  So students looking for a study group can find me

  Scenario: Student logged in, adds a course (happy path)
    Given that I am logged in as "Cody" "Poll" with email "CJPoll@gmail.com"
    And "Cody" "Poll" attends "BYU-Idaho"
    And there is a course called "Computer Science 101" at "BYU-Idaho"
    When I visit the course index
    And I register as a student of "Computer Science 101"
    Then I should be registered for the "Computer Science 101" course at "BYU-Idaho"

  Scenario: Tutor logged in, adds a course (happy path)
    Given that I am logged in as "Cody" "Poll" with email "CJPoll@gmail.com"
    And "Cody" "Poll" tutors at "BYU-IDaho"
    And there is a course called "Computer Science 101" at "BYU-Idaho"
    When I visit the course index
    And I select the "Computer Science 101" course at "BYU-Idaho"
    And I press the tutor course button
    Then I should be registered as a tutor for the "Computer Science 101" course at "BYU-Idaho"
