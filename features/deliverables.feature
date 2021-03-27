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

    And I am on the profile1 homepage
	And I follow "group10"
    And I am on the group10 homepage
    And I follow "project11"
    Then I should be on the project11 homepage

Scenario: Edit an exisitng deliverable
    When I click on edit for deliverable 5
    Then I should see "Editing Deliverable"
    And  I fill in "Status" with "Complete"
    And I press "Update Deliverable"
    Then I should be on "the project11 homepage"
    And the project "Deliver 5" should have a status of "Complete"

Scenario: Create a new deliverable
    When I follow "Add new deliverable"
    Then I should see "Create a new deliverable for project11"
    And  I fill in "Name" with "Brand new deliverable"
    And I press "Create Deliverable"
    Then I should be on "the project11 homepage"
    And I should see "Brand new deliverable"

Scenario: Did not fill out fields
    When I click on edit for deliverable 5
    Then I should see "Editing Deliverable"
    And  I fill in "Name" with ""
    And I press "Update Deliverable"
    Then I should see "Deliverable must have a name"