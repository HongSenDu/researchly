Feature: allow users to sign out
 
  As an exisiting researchly user
  so I can protect my account from unauthorized access
  I want to be able to sign ou from my account

Scenario: User signs out
  Given I am logged in
  When I sign out
  Then I should see a signed out message
  When I return to the site
  Then I should be signed out