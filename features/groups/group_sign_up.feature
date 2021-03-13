Feature: allow users to join groups

    As a researchly users
    so I can work with my peers on this application
    I want to be able to sign up for a group

Background:
    Given I am logged in
    Given there are groups added to the database

Scenario: User joins a valid group
    When I sign up with a valid group
    Then I should see a successful sign up message
