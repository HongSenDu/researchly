Feature: Edit projects

	As a user, I want to see, edit and create current projects for a group, so that I can monitor all of the group's projects

Background: projects added to the database

	Given the following users exists:
	|id		|email			|password	|password_confirmation	|
	|1		|a@gmail.com	|123456		|123456					|

	Given the following group exists:
	|id		|name			|description
	|1		|group1			|Columbia University's single Bio Lab

	Given the following memberships exists:
	|id		|user_id			|group_id 	|
	|1		|1					|1			|

	Given the following projects exist: 
	|id		|name		|description		|status		|group_id	|
	|1		|project2	|description		|complete	|1			|
	|2		|project1	|something			|ongoing	|1			|

	And I am on the profile1 homepage
	And I follow "group1"
	Then I should be on the group1 homepage
	And I should see "project2" before "project1"

Scenario: I sort by name 
	When I follow "Project"
	Then I should see "project1" before "project2"

Scenario: I sort by status 
	When I follow "Status"
	Then I should see "project1" before "project2"

