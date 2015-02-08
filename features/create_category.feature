Feature: Create Categories
  As a blog administrator
  In other to make it easier for me to keep track of my articles
  I want to be able to add categories, to which articles belong, to my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully add categories
    Given I am on the admin content page
    Then I should see "Categories"
    When I follow "Categories"
    Then I should see "Name"
    And I should see "Keywords"
