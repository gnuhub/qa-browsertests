@en.wikipedia.beta.wmflabs.org @login @test2.wikipedia.org
Feature: Math

  Scenario: Display simple math
    Given I am logged in
      And I am editing page that does not exist
    When I type <math>3 + 2</math>
      And I click Preview
    Then the page should contain an img tag
      And alt for that img should be 3 + 2
      And src for that img should come from //upload
