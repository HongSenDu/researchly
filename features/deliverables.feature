Feature: display and be able to interact with deliverables

    As an exisiting user I want to be able to view, modify, and create deliverables for my projects

Background: populate tables

	Given the following users exists:
	|id		|email			|password	|password_confirmation	|
	|1		|a@gmail.com	|123456		|123456					|

    Given the following groups exist:
    | id    | name      | description   |
    | 10    | group10   | Group 10      |

    Given the following memberships exists:
	|id		|user_id			|group_id 	|
	|1		|1					|10		    |

    Given the following projects exist:
    | id    | name      | description       | group_id  |
    | 11    | project11 | The 11th project  | 10        |

    Given the following deliverables exist:
    | id    | name      | description           | status      | project_id |
    | 5     | Deliver 5 | The fifth deliverable | started     | 11         |
    | 4     | Deliver 4 | The fifth deliverable | finished    | 11         |

    And I am on the profile1 homepage
	And I follow "group10"
    And I am on the group10 homepage
    And I follow "project11"
    Then I should be on the project11 homepage


Scenario: Sort by status
    When I follow "Status"
    Then I should be on "the project11 homepage"
    And I should see "Deliver 4" before "Deliver 5"

Scenario: Sort by name
    When I follow "Deliverable"
    Then I should see "Deliver 4" before "Deliver 5"

Scenario: Edit an exisitng deliverable
    When I click on edit for deliverable 5
    Then I should see "Editing Deliverable"
    And  I select "Complete" from "status"
    And I press "Update Deliverable"
    Then I should be on "the deliverable5 homepage"
    And I should see "Deliverable was successfully updated."

Scenario: Create a new deliverable
    When I follow "Add new deliverable"
    Then I should see "Create a new deliverable for project11"
    And  I fill in "Name" with "Brand new deliverable"
    And  I select "Ongoing" from "status"
    And I press "Create Deliverable"
    Then I should be on "the project11 homepage"
    And I should see "Brand new deliverable"

Scenario: Did not fill out fields
    When I click on edit for deliverable 5
    Then I should see "Editing Deliverable"
    And  I fill in "Name" with ""
    And I press "Update Deliverable"
    Then I should see "Deliverable must have a name"

Scenario: Delete an exisitng deliverable
    When I press delete for deliverable 4
    Then I should see "Deliverable was successfully destroyed."
    And I should not see "Deliver 4"

Scenario: Update percentage for complete
    When I click on edit for deliverable 5
    Then I should see "Editing Deliverable"
    And  I select "Complete" from "status"
    And I press "Update Deliverable"
    Then I should be on "the deliverable5 homepage"
    And I follow "Back"
    Then I should see "Percent Completed: 50.0%"

Scenario: Delete all deliverables for the project
    When I press delete for deliverable 4
    And I press delete for deliverable 5
    Then I should see "No deliverables created for this project"