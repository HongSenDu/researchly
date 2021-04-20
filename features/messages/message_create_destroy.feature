Feature: allow users to create and destroy messages amongst one another

    As an existing researchly user and group member 
    so I can view, create, and destroy messages

Background:
    Given the following groups exist:
    |name              |description        |
    |Bio Group         |bio group          |
    |Chemistry Group   |chem group         |
    
    Given the following users exist:
    |email             |password           |password_confirmation |username|
    |andrew@gmail.com  |topsecret          |topsecret             |Andrew  |
    |michael@gmail.com |topsecret          |topsecret             |Michael |
    |aaron@gmail.com   |topsecret          |topsecret             |Aaron   |

    Given the following memberships exist:
    |user_id           |group_id           |member_type|
    |1                 |1                  |leader     |
    |2                 |1                  |member     |
    |3                 |2                  |member     |
    
    Given the following messages exist:
    |user_id|recipient_id|group_id    |body           |subject    |user_read|recipient_read|show_user|show_recipient|
    |2      |1           |            |hello world    |hello there|false    |false         |true     |true          |
    |2      |3           |            |hello world    |hello there|false    |false         |true     |true          |

    Given I am signed in with "andrew@gmail.com" and "topsecret"
    Given there are groups added to the database
    Given I am on the inbox page

    Scenario: Create a new message
    When I follow "New Message"
    Then I should see "To"
    And I select option "Michael" from dropdown for "message_recipient_id"
    And I fill in "Subject" with "new Message"
    And I fill in "Body" with "This is a new Message"
    And I press "Create"
    Then I should see "new Message"
    And I should see "This is a new Message"

    Scenario: View a message
    When I follow "Show"
    Then I should see "hello world"
    When I follow "Back to All Messages"
    Then I should see "Messages"

    Scenario: Delete a message
    When I press "Delete"
    Then I should see "Message deleted"