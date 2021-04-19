Feature: User joining group is mentioned in recent activity

    As a user I would like to see who joins my group

Background:
    Given the following groups exist:
    |name              |description        |code    |
    |Bio Group         |bio group          |abcdefgh|
    |Chemistry Group   |chem group         |ijklmnop|
    
    Given the following users exist:
    |id |email             |password           |password_confirmation |username |
    |1  |andrew@gmail.com  |topsecret          |topsecret             |andrew   |
    |2  |michael@gmail.com |topsecret          |topsecret             |michael  |
    |3  |aaron@gmail.com   |topsecret          |topsecret             |aaron    |

    Given the following memberships exist:
    |user_id           |group_id           |
    |1                 |2                  |
    |2                 |1                  |
    |3                 |                   |
    
    Given I am logged in
    Given there are groups added to the database

    Scenario: Sign up to a group
        When I follow "Join a Group"
        When I fill in "Search Groups" with "bio"
        And I press "Search"
        Then I should see "Bio Group"
        When I fill in "Enter group code to join" with "abcdefgh"
        When I press "Join"
        Then I should see "Successfully Joined"
        Then I should see "joined our group!"
        And I follow "see all changes"
        Then I should see "joined our group!"
