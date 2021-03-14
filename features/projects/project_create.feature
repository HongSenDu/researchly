Feature: Edit projects

	As a user, I want to see, edit and create current projects for a group, so that I can monitor all of the group's projects

Background: projects added to the database

	Given the following group exists:
	|id		|name			|description
	|1		|Bio Lab		|Columbia University's single Bio Lab

	Given the following projects exist: 
	|id		|name		|description		|group_id|
	|1		|project1	|description		|1		 |
	|2		|project2	|something			|1		 |

	And I am on the Group1 homepage

Scenario: Create a Project
	When I follow "New Project"
	Then I should be on the new Project page
	And I fill in "Name" with "Project3"
	And I fill in "Description" with "Project 3 Description"
	And I press "Create"
	Then I should be on the projects3 detail page
	And I should see "Project3"
	And I should see "Project 3 Description"

Scenario: Cannot Create Project with no Name (Sad Path)
	When I follow "New Project"
	Then I should be on the new Project page
	And I fill in "Name" with ""
	And I press "Create"
	Then I should see "Project must have a name"

Scenario: I want to cancel creating a group (Sad Path)
	When I follow "New Project"
	Then I should be on the new Project page
	And I follow "Cancel"
	Then I should be on the Group1 homepage 

