Feature: allow users to edit the details of a group

    As an existing researchly user and group member 
    so I can view, edit, create groups

Background:
    Given I am logged in
    Given there are groups added to the database
    Given I am a member of a group
    Given I am on the User1 homepage

Scenario: Create a new group
    When I follow "New Group"
    Then I should be on the new Group page
    And I fill in "Name" with "newGroup"
    And I fill in "Description" with "A new group Description"
    And I press "Create"
    Then I should be on the newGroup detail page
    And I should see "newGroup"
    And I should see "A new group Description"

Scenario: Edit Existing Group Description
    When I follow "Group 1"
    And I follow "Edit"
    Then I should be on the details page for "Group 1"
    And I fill in "Description" with "coolest group"
    And I press "Update Group"
    Then I should be on the User1 homepage
    And I should see "coolest group"

Scenario: Edit Existing Group Name
    When I follow "Group 1"
    And I follow "Edit"
    Then I should be on the details page for "Group 1"
    And I fill in "name" with "Cool Group 1"
    And I press "Update Group"
    Then I should be on the User1 homepage
    And I should see "Cool Group 1"

Scenario: Cannot Create Group with no Name (Sad Path)
    When I follow "Group 1"
    And I follow "Edit"
    Then I should be on the details page for "Group 1"
    And I fill in "Name" with ""
    And I press "Create"
    And I press "Update Group"
    And I should see "Group must have a name"

Scenario: Cannot Edit Group to have No Descritption (Sad Path)
    When I follow "Group 1"
    And I follow "Edit"
    Then I should be on the details page for "Group 1"
    And I fill in "Description" with ""
    And I press "Update Group"
    And I should see "Group name required"

Scenario: Cancel creating a group (Sad Path)
    When I follow "New Group"
    Then I should be on the new Group page
    And I follow "Cancel" 
    Then I should be on the User1 homepage