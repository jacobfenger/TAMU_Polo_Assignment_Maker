Feature: Add and edit horses to the database

	As an officer,
	I want to add a horse to the database 
	So that I can assign the horse to a member

Background:
	Given I am logged into the officers panel
	And I follow "Horses"

Scenario: Successfully add a horse
	Given I am on the horses page
	And I follow "Add a horse"
	And I fill in "Name" with "NEIGHBOR"
	And I fill in "Age" with "1"
	And I press "Save Changes"
	Then I should see "Horse was saved successfully"

Scenario: Successfully handle improper input when added a horse
	Given I am on the horses page
	And I follow "Add a horse"
	And I fill in "Name" with ""
	And I press "Save Changes"
	Then I should see "Horse was not saved successfully"





