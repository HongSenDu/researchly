Feature: allow users to sign up and or leave a group

    As an existing researchly user and group member 
    so I can sign up to, or leave groups

Background:
    Given the following groups exist:
    |name              |description        |
    |Bio Group         |bio group          |
    |Chemistry Group   |chem group         |
    
    Given the following users exist:
    |email             |password           |password_confirmation |
    |andrew@gmail.com  |topsecret          |topsecret             |
    |michael@gmail.com |topsecret          |topsecret             |
    |aaron@gmail.com   |topsecret          |topsecret             |

    Given the following memberships exist:
    |user_id           |group_id           |
    |1                 |2                  |
    |2                 |1                  |
    |3                 |                   |
    
    Given I am logged in
    Given there are groups added to the database

    Scenario: Sign up to a group I am not a member of
    
    Scenario: Sign up to a group I am already a member of

    Scenario: Leave group I am a member of