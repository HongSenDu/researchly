Feature: allow users to sign up and or leave a group

    As an existing researchly user and group member 
    so I can sign up to, or leave groups

Background:
    Given the following groups exist:
    |name              |description        |code    |
    |Bio Group         |bio group          |abcdefgh|
    |Chemistry Group   |chem group         |ijklmnop|
    
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

    Scenario: Sign up to a group
        When I follow "Join a Group"
        When I fill in "Search Groups" with "bio"
        And I press "Search"
        Then I should see "Bio Group"
        When I fill in "Enter group code to join" with "abcdefgh"
        When I press "Join"
        Then I should see "Successfully Joined"

    Scenario: Sign up to a group with the wrong code
        When I follow "Join a Group"
        When I fill in "Search Groups" with "bio"
        And I press "Search"
        Then I should see "Bio Group"
        When I fill in "Enter group code to join" with "gajkdbv"
        When I press "Join"
        Then I should see "Wrong code"

    Scenario: Sign up to a group without a code
        When I follow "Join a Group"
        When I fill in "Search Groups" with "bio"
        And I press "Search"
        Then I should see "Bio Group"
        When I press "Join"
        Then I should see "Need code"
    
    Scenario: Signing up to a group I am already a part of
        When I follow "Join a Group"
        When I fill in "Search Groups" with "bio"
        And I press "Search"
        Then I should see "Bio Group"
        When I fill in "Enter group code to join" with "abcdefgh"
        When I press "Join"
        Then I should see "Successfully Joined"
        When I follow "Back"
        When I follow "Join a Group"
        When I fill in "Search Groups" with "bio"
        And I press "Search"
        Then I should see "Bio Group"
        When I fill in "Enter group code to join" with "abcdefgh"
        When I press "Join"
        Then I should see "Already Joined"

    Scenario: Leave Group
        When I follow "Join a Group"
        When I fill in "Search Groups" with "bio"
        And I press "Search"
        Then I should see "Bio Group"
        When I fill in "Enter group code to join" with "abcdefgh"
        When I press "Join"
        Then I should see "Successfully Joined"
        When I follow "Back"
        When I follow "Bio Group"
        Then I follow "Leave Group"
        Then I should see "Sucessfully Left Group"