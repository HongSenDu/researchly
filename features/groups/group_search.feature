Feature: allow users to search for groups

    As an existing researchly user and group member 
    so I can sign up to, or leave groups

Background:
    Given the following groups exist:
    |name              |description        |
    |Bio Group         |bio group          |
    |Chemistry Group   |chem group         |
    
    Given the following users exist:
    |email             |password           |password_confirmation |
    |andrew@gmail.com  |topsecret          |topsecret             |
    |michael@gmail.com |topsecret          |topsecret             |
    |aaron@gmail.com   |topsecret          |topsecret             |

    Given the following memberships exist:
    |user_id           |group_id           |
    |1                 |2                  |
    |2                 |1                  |
    |3                 |                   |
    
    Given I am logged in
    Given there are groups added to the database
    Given I am on the groups page

    Scenario: I search for a group
    When I fill in "Search Groups" with "bio"
    And I press "Search"
    Then I should see "Bio Group"

    Scenario: I leave the search blank
    When I press "Search"
    Then I should see "Empty field"