Feature: display and be able to interact with projects

	I want to be able to see all current projects for a group and then be able to check and modify one so that its status is set to finished

Background: projects added to the database

	Given the following group exists:
	|id		|name			|description
	|1		|group1			|a cool group

	Given the following projects exist: 
	|id		|name		|description		|group_id|
	|1		|project1	|description		|1		 |


	And I am on the Group1 homepage

Scenario: Change Existing Project Name
	When I follow "project1"
	And I follow "Edit"
	Then I should be on the details page for “project1”
	And I fill in "Name" with "ProjectA"
	And I press "Update Project"
	Then I should be on the project1 homepage
	And I should see "ProjectA"

Scenario: Create a Project
	When I click “Create”
	Then I should be on the new Project page
	And I fill in "Name" with "Project3"
	And I fill in “Description” with “Project 3 Description”
	And I press “Update”
	Then I should be on the test-group1 homepage
	And I should see “Project3”
	And I should see “Project 3 Description”
