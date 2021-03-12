Feature: allow users to join groups

As a researchly users
so I can work with my peers on this application
I want to be able to sign up for a group

Background:
Given I am logged in
Given there are groups added to the database

Scenario: Authorized User joins a valid group
When I am authorized to sign up with a valid group
Then I should see a successful sign up message

Scenario: Not Authorized joins a valid group
When I am not authorized to sign up with a valid group
Then I should see a not authorized message

Scenario: User joins an invalid group
When I try to join an invalid group
Then I should see an invalid group message
