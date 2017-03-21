Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and serach on director information in movies I enter

  Background: movies in database

    Given the following movies exist:
      | title        | rating | director     | release_date |
      | Star Wars    | PG     | George Lucas |   1977-05-25 |
      | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
      | Alien        | R      |              |   1979-05-25 |
      | THX-1138     | R      | George Lucas |   1971-03-11 |


  Scenario: add director to existing movie
    When I go to the edit page for "Alien"
    And  I fill in "Director" with "Ridley Scott"
    And  I press "Update Movie Info"
    Then the director of "Alien" should be "Ridley Scott"

  Scenario: find movie with same director
    Given I am on the details page for "Star Wars"
    When  I follow "Find Movies With Same Director"
    Then  I should be on the Similar Movies page for "Star Wars"
    And   I should see "THX-1138"
    But   I should not see "Blade Runner"

  Scenario: can't find similar movies if we don't know director (sad path)
    Given I am on the details page for "Alien"
    Then  I should not see "Ridley Scott"
    When  I follow "Find Movies With Same Director"
    Then  I should be on the home page
    And   I should see "'Alien' has no director info"

  Scenario: test new action
    When I go to create new movie page
    And  I fill in "Title" with "Man in Black"
    And  I fill in "Director" with "David Jones"
    And  I press "Save Changes"
    Then I should be on the home page
    And  I should see "Man in Black was successfully created."
    And I should see "Man in Black"

  Scenario: test destroy
    Given I am on the details page for "Star Wars"
    When  I press "Delete"
    Then I should be on the home page
    And  I should see "Movie 'Star Wars' deleted."

   Scenario: test refresh
    Given I am on the home page
     When I check "ratings[PG]"
     And I uncheck "ratings[R]"
     And I press "Refresh"
     Then I should be on the home page
     And I should see "Blade Runner"
     But I should not see "Alien"

   Scenario: test sort by title
     Given I am on the home page
     When I follow "Movie Title"
     Then I should be on the home page
     And I should see "Blade Runner"

    Scenario: test sort by date
      Given I am on the home page
      When I follow "Release Date"
      Then I should be on the home page
      And I should see "Blade Runner"

  Scenario: test bad path for refresh
    Given I am on the home page
    When I uncheck "ratings[R]"
    And I uncheck "ratings[PG]"
    And I uncheck "ratings[G]"
    And I uncheck "ratings[PG-13]"
    And I uncheck "ratings[NC-17]"
    And I press "Refresh"
    Then I should be on the home page
    And I should see "Blade Runner"

