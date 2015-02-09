Feature: Merge Articles
  As a blog administrator
  In order to prevent redundancy on my blog
  I want to be able to merge articles with similar content

  Background:
    Given the blog is set up
    And the following articles exist:
    | title                | user      | body                                 |
    | My guitar party      | admin     | I, admin, had a fun guitar party     |
    | admin's guitar party | notadmin  | I, notadmin, enjoyed admin no party  |
    | Swimming             | notadmin  | I went to Okinawa and swam           |
    And the following comments exist:
    | body                 | article              | author      |
    | love you, admin      | My guitar party      | jessica     |
    | love you, notadmin   | admin's guitar party | james       |
    | I went too!          | Swimming             | bobby       |
    
  Scenario: Non-admin does not see merge interface
    Given I am logged in as notadmin
    And I am on the edit page for "admin's guitar party"
    Then I should see "enjoyed admin no party"
    And I should see "Tags"
    And I should see "Excerpt"
    And I should not see "Merge Articles"

  Scenario: Admin sees merge interface
    Given I am logged into the admin panel
    And I am on the edit page for "My guitar party"
    Then I should see "I, admin, had a fun guitar party"
    And I should see "Tags"
    And I should see "Excerpt"
    And I should see "Merge Articles"

  Scenario: Merged articles have the text and comments of both articles, title and author of first
    Given I am logged into the admin panel
    And I am on the edit page for "My guitar party"
    Then I should see "Merge Articles"
    When I type the id of article "admin's guitar party" into "merge_with"
    And I press "Merge"
    And I go to the home page
    Then I should see "My guitar party"
    And I should not see "admin's guitar party"
    When I follow "My guitar party"
    Then I should see "I, admin, had a fun guitar party"
    Then I should see "I, notadmin, enjoyed admin no party"
    And I should see "love you, admin"
    And I should see "love you, notadmin"
    And I should not see "I went too"

