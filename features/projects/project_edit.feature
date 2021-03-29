Feature: Edit projects

	As a user, I want to see, edit and create current projects for a group, so that I can monitor all of the group's projects

Background: projects added to the database

	Given the following users exists:
	|id		|email			|password	|password_confirmation	|
	|1		|a@gmail.com	|123456		|123456					|

	Given the following group exists:
	|id		|name			|description							|
	|1		|group1			|Columbia University's single Bio Lab	|

	Given the following memberships exists:
	|id		|user_id			|group_id	|
	|1		|1					|1			|

	Given the following projects exist: 
	|id		|name		|description		|group_id|
	|1		|project1	|description		|1		 |
	|2		|project2	|something			|1		 |

	And I am on the profile1 homepage
	And I follow "group1"
    And I am on the group1 homepage
    And I follow "project1"
    Then I should be on the project1 homepage
	And I am on the details page for “project1”

Scenario: Change Existing Project Name
	When I fill in "Project Name" with "ProjectA"
	And I press "Update Project"
	Then I should be on the project1 homepage
	And I should see "ProjectA"

Scenario: Change Existing Project Description
	When I fill in "Description" with "the coolest description"
	And I press "Update Project"
	Then I should be on the project1 homepage
	And I should see "the coolest description"

Scenario: Change Existing Project Status
	When I fill in "Status" with "complete"
	And I press "Update Project"
	Then I should be on the project1 homepage
	And I should see "complete"

Scenario: Cannot Edit Project to Have No Name (Sad Path)
	When I fill in "Project Name" with ""
	And I press "Update"
	Then I should see "Project must have a name"

Scenario: I want to cancel editing a group (Sad Path)
	When I follow "Cancel"
	Then I should be on the project1 homepage
	


