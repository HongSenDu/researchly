Feature: display and be able to interact with projects

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

Scenario: Change Existing Project Name
	When I follow "project1"
	And I follow "Edit"
	Then I should be on the details page for “project1”
	And I fill in "Project Name" with "ProjectA"
	And I press "Update Project"
	Then I should be on the project1 homepage
	And I should see "ProjectA"

Scenario: Change Existing Project Description
	When I follow "project1"
	And I follow "Edit"
	Then I should be on the details page for “project1”
	And I fill in "Description" with "the coolest description"
	And I press "Update Project"
	Then I should be on the project1 homepage
	And I should see "the coolest description"

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
	When I follow "project1"
	And I follow "Edit"
	Then I should be on the details page for “project1”
	And I fill in "Name" with ""
	And I press "Update Project"
	And I should see "Project must have a name"

Scenario: Cannot Edit Project to Have No Name (Sad Path)
	When I follow "New Project"
	Then I should be on the new Project page
	And I fill in "Description" with "Project 4 Description"
	And I press "Create"
	Then I should be on the new Project page
	And I should see "Project must have a name"

Scenario: I want to cancel creating a group (Sad Path)
	When I follow "New Project"
	Then I should be on the new Project page
	And I follow "Cancel"
	Then I should be on the Group1 homepage 

