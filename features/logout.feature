Feature: Logout for members

As a user of the site,
I want to be able to logout of my account,
So that others cannot easily access my account

Background:
	
	Given I am logged into the officers panel

Scenario:

	And I follow "Logout"
	Then I should see "Login"
	And I should see "Welcome to the Home Page!"
