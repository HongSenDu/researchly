Feature: allow users to join groups

    As a researchly users
    so I can work with my peers on this application
    I want to be able to sign up for a group

Background:
    Given the following group exist:
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

Scenario: User joins a valid group
    When I go to the show page for "Bio Group"
    And I follow "Sign up"
    Then I should see "Successfully Joined"
