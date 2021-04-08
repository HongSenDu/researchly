Feature: Group users can see recent group activity relating to group projects

    As an exisiting user I want to be able to view my group's recent project activity

Background: populate tables

	Given the following users exists:
	|id		|email			|password	|password_confirmation	|username               |
	|1		|a@gmail.com	|123456		|123456					|awesome user           |

    Given the following groups exist:
    | id    | name      | description   |
    | 10    | group10   | Group 10      |

    Given the following memberships exists:
	|id		|user_id			|group_id 	|
	|1		|1					|10		    |

    Given the following projects exist:
    | id    | name      | description       | group_id  |
    | 11    | project11 | The 11th project  | 10        |

    And I am on the profile1 homepage
	And I follow "group10"
    And I am on the group10 homepage
    And I follow "project11"
    Then I should be on the project11 homepage

Scenario: Creating a Project
    When I am on the group10 homepage
    And I follow "New Project"
	Then I should be on the new Project page
	And I fill in "Name" with "Project12"
	And I press "Create"
	Then I should be on the Project12 page
    And I follow "Back"
	Then I should see "awesome user created Project12 project"
    And I follow "see all changes"
    Then I should see "awesome user created Project12 project"

Scenario: Editing a Project
    When I am on the details page for project11
    And I fill in "Project Name" with "ProjectA"
	And I press "Update Project"
	Then I should be on the project11 homepage
    And I follow "Back"
	Then I should see "awesome user edited ProjectA project"
    And I follow "see all changes"
    Then I should see "awesome user edited ProjectA project"

Scenario: Deleting a Project
    When I press "delete"
    Then I should be on the group10 homepage
    Then I should see "awesome user deleted a project"
    And I follow "see all changes"
    Then I should see "awesome user deleted a project"