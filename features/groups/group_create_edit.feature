Feature: allow users to create and edit the details of a group

    As an existing researchly user and group member 
    so I can view, edit, create groups

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
    |user_id           |group_id           |member_type|
    |1                 |1                  |leader     |
    |2                 |1                  |member     |
    |3                 |2                  |member     |
    
    Given I am signed in with "andrew@gmail.com" and "topsecret"
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

Scenario: Try to Create a new group without a name
    When I follow "New Group"
    Then I should see "Create new Group"
    And I fill in "Name" with ""
    And I fill in "Description" with "A new group Description"
    And I press "Create"
    Then I should see "Group must have a name"
    
Scenario: Edit Existing Group Description
    When I go to the show page for "Bio Group"
    And I follow "Edit"
    Then I should see "Editing Group"
    And I fill in "Description" with "coolest group"
    And I press "Update Group"
    And I should see "coolest group"

Scenario: Edit Existing Group Name
    When I go to the show page for "Bio Group"
    And I follow "Edit"
    Then I should see "Editing Group"
    And I fill in "Name" with "Cool Group 1"
    And I press "Update Group"
    And I should see "Cool Group 1"

Scenario: Cannot Create Group with no Name (Sad Path)
    When I go to the show page for "Bio Group"
    And I follow "Edit"
    Then I should see "Editing Group"
    And I fill in "Name" with ""
    And I press "Update Group"
    And I should see "Group must have a name and description"

Scenario: Cannot Edit Group to have No Descritption (Sad Path)
    When I go to the show page for "Bio Group"
    And I follow "Edit"
    Then I should see "Editing Group"
    And I fill in "Description" with ""
    And I press "Update Group"
    And I should see "Group must have a name and description"

Scenario: Cancel creating a group (Sad Path)
    When I follow "New Group"
    Then I should see "Create new Group"
    And I follow "Cancel" 
    Then I should see "Groups"

Scenario: Upgrade a member to leader
    When I go to the show page for "Bio Group"
    And I follow "Upgrade to Leader"
    Then I should see "is now a leader"

Scenario: Upgrading a member who is already a leader
    When I go to the show page for "Bio Group"
    And I follow "Upgrade to Leader"
    Then I should see "is now a leader"
    And I follow "Upgrade to Leader"
    Then I should see "Already a group leader"