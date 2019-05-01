Feature: Add practices and assignments to database

	As an officer,
	I want to add practices to the database
	So that members are able to sign up for them. 

Background: 

	Given I am logged into the officers panel
	And I follow "Practices"

Scenario: Invalid practice creation
	
	Given I am on the practices page
	And I follow "Create new practice"
	And I fill in "Practice Time" with "12:30 PM"
	And I press "Save Changes"
	Then I should see "There was an error in practice creation."

Scenario: Successful practice creation

	Given I am on the practices page
	And I follow "Create new practice"
	And I fill in "Practice Time" with "12:30 PM"
	And I fill in "Practice Date" with "2019/04/30"
	And I fill in "Practice Summary" with "Scrimmage"
	And I press "Save Changes"
	Then I should see "Successfully created a practice"
	And I should see "12:30 PM"

Scenario: Sign Up for a Practice

	Given I am on the practices page
	And I follow "Create new practice"
	And I fill in "Practice Time" with "12:30 PM"
	And I fill in "Practice Date" with "2019/04/30"
	And I fill in "Practice Summary" with "Scrimmage"
	And I press "Save Changes"
	Then I should see "Successfully created a practice"
	And I follow "Sign Up"
	Then I should see "Assignments"
	And I follow "Sign Up"
	And I press "Save Changes"
	Then I should see "Successfully signed up"