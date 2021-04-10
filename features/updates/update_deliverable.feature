Feature: display and be able to interact with deliverables

    As an exisiting user I want to be able to view, modify, and create deliverables for my projects

Background: populate tables

	Given the following users exists:
	|id		|email			|password	|password_confirmation	|username       |
	|1		|a@gmail.com	|123456		|123456					|awesome user   |

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

Scenario: Creating a Deliverable
    When I follow "Add new deliverable"
    Then I should see "Create a new deliverable for project11"
    And  I fill in "Name" with "new task"
    And I press "Create Deliverable"
    Then I should be on "the project11 homepage"
    And I follow "Back"
    Then I should see "awesome user created new task deliverable for project11"
    And I follow "see all changes"
    Then I should see "awesome user created new task deliverable for project11"

Scenario: Edit an exisitng deliverable
    When I click on edit for deliverable 5
    Then I should see "Editing Deliverable"
    And  I fill in "Status" with "Complete"
    And I press "Update Deliverable"
    And I follow "Back"
    And I follow "Back"
    Then I should see "awesome user edited Deliver 5 deliverable for project11 project"
    And I follow "see all changes"
    Then I should see "awesome user edited Deliver 5 deliverable for project11 project"

Scenario: Delete an exisitng deliverable
    When I press delete for deliverable 4
    Then I should see "Deliverable was successfully destroyed."
    And I should not see "Deliver 4"
    And I follow "Back"
    Then I should see "awesome user deleted a deliverable"
    And I follow "see all changes"
    Then I should see "awesome user deleted a deliverable"