Feature: allow users to create and edit the details of a group

    As an existing researchly user and group member 
    so I can view, edit, create groups

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
    Given I am on the groups page

Scenario: Create a new group
    When I follow "New Group"
    Then I should see "Create new Group"
    And I fill in "Name" with "newGroup"
    And I fill in "Description" with "A new group Description"
    And I press "Create"
    Then I should see "newGroup"
    And I should see "A new group Description"

Scenario: Edit Existing Group Description
    When I go to the show page for "Bio Group"
    When I follow "Edit"
    Then I should be on the details page for "Bio Group"
    And I fill in "Description" with "coolest group"
    And I press "Update Group"
    Then I should be on the User1 homepage
    And I should see "coolest group"

Scenario: Edit Existing Group Name
    When I go to the show page for "Bio Group"
    Then I follow "Edit"
    Then I should be on the details page for "Bio Group"
    And I fill in "name" with "Cool Group 1"
    And I press "Update Group"
    Then I should be on the User1 homepage
    And I should see "Cool Group 1"

Scenario: Cannot Create Group with no Name (Sad Path)
    When I go to the show page for "Bio Group"
    Then I follow "Edit"
    Then I should be on the details page for "Bio Group"
    And I fill in "Name" with ""
    And I press "Create"
    And I press "Update Group"
    And I should see "Group must have a name"

Scenario: Cannot Edit Group to have No Descritption (Sad Path)
    When I go to the show page for "Bio Group"
    And I follow "Edit"
    Then I should be on the details page for "Bio Group"
    And I fill in "Description" with ""
    And I press "Update Group"
    And I should see "Group name required"

Scenario: Cancel creating a group (Sad Path)
    When I follow "New Group"
    Then I should see "Create new Group"
    And I follow "Cancel" 
    Then I should see "Groups"