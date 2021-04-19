Feature: See who was assigned to a deliverable

    As an exisiting user I want to be able to view recent assignments in my group

Background: populate tables

	Given the following users exists:
	|id		|email			|password	|password_confirmation	|username       |
	|1		|a@gmail.com	|123456		|123456					|awesome user   |
    |2      |b@gmail.com    |123456     |123456                 |cool user      |

    Given the following groups exist:
    | id    | name      | description   |
    | 10    | group10   | Group 10      |

    Given the following memberships exists:
	|id		|user_id			|group_id 	|
	|1		|1					|10		    |
    |2      |2                  |10         |

    Given the following projects exist:
    | id    | name      | description       | group_id  |
    | 11    | project11 | The 11th project  | 10        |

    Given the following deliverables exist:
    | id    | name      | description           | status      | project_id |
    | 5     | Deliver 5 | The fifth deliverable | started     | 11         |
    | 4     | Deliver 4 | The fifth deliverable | finished    | 11         |

    Given the following assignments exist:
    |id		|user_id			|deliverable_id 	|
	|1		|1					|5		            |

    And I am on the profile1 homepage
	And I follow "group10"
    And I am on the group10 homepage
    And I follow "project11"
    Then I should be on the project11 homepage

Scenario: Assigning a user to a new Deliverable
    When I follow "Add new deliverable"
    Then I should see "Create a new deliverable for project11"
    And  I fill in "Name" with "new task"
    And I check "cool user"
    And I press "Create Deliverable"
    Then I should be on "the project11 homepage"
    And I follow "Back"
    Then I should see "cool user was assigned to new task deliverable"
    And I follow "see all changes"
    Then I should see "cool user was assigned to new task deliverable"

Scenario: Assigning a user to an exisitng deliverable
    When I click on edit for deliverable 5
    Then I should see "Editing Deliverable"
    And  I select "Complete" from "status"
    And I check "cool user"
    And I press "Update Deliverable"
    And I follow "Back"
    And I follow "Back"
    Then I should see "cool user was assigned to Deliver 5 deliverable"
    And I follow "see all changes"
    Then I should see "cool user was assigned to Deliver 5 deliverable"

