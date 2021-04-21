Feature: be able to interact with the user controls

    As an existing user I want to see projects and deliverables on my homepage

Background: populate tables

	Given the following users exists:
	|id		|email			|password	|password_confirmation	| username |
	|1		|a@gmail.com	|123456		|123456					| Steve    |

    Given the following groups exist:
    | id    | name      | description   |
    | 10    | group10   | Group 10      |
    | 11    | group11   | Group 11      |

    Given the following memberships exists:
	|id		|user_id			|group_id 	| username  |
	|1		|1					|10		    | Steve     |

    Given the following projects exist:
    | id    | name      | description       | group_id  |
    | 11    | project11 | The 11th project  | 10        |

    Given the following deliverables exist:
    | id    | name      | description           | status      | project_id |
    | 5     | Deliver 5 | The fifth deliverable | started     | 11         |
    | 4     | Deliver 4 | The fifth deliverable | finished    | 11         |

    Given the following assignments exist:
    | id    | user_id      | deliverable_id        | 
    | 1     | 1            | 5                     | 
    | 2     | 1            | 4                     | 


Scenario: See projects
    When I am on the profile1 homepage
    Then I should see "group10"
    And I should not see "group11"

Scenario: See deliverables
    When I am on the profile1 homepage
    Then I should see "Deliver 5"
    And I should see "Deliver 4"