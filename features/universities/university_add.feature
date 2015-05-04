Feature: User associates with a university
  As a tutor
  I want to associate myself with a university
  So that students from that university can find me

  As a student
  I want to associate myself with a university
  So that I can find tutors and study groups for my classes

  @wip
  Scenario: User associates with university (Student or Tutor)
    Given that I am logged in as "Mike" "Simpson" with email "test@email.com"
    And a university called "BYU-Idaho" exists
    When I visit "/universities"
    And I associate myself with "BYU-Idaho"
    Then I should see an index of courses at "BYU-Idaho"
