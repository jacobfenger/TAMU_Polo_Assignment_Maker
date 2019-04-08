Feature: Login for members

As an officer or member,
I want to be able to view club member information
So that I can easily contact members or manipulate roles for the website

Background: 

	Given I am logged into the officers panel
	And I follow "Member List"

Scenario: View members in database
	
	Given I am on the users page
	Then I should see "admin_first"
