Feature: allow users to delete groups

    As an existing researchly user and group member 
    so I can delete groups

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

    Scenario: I want to delete a group
    When I go to the show page for "Bio Group"
    And I press "Delete Group"
    Then I should see "Group was successfully destroyed"