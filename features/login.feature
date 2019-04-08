Feature: Login for members

As a member,
I want to login to the website without administrative privileges
So that I can view statistics about myself or other members and also 
see assignments for practices.

Background:
	
	Given I am on the signup page

Scenario: Successful signup
	
	And I fill in "First Name:" with "admin_first"
	And I fill in "Last Name:" with "admin_last"
	And I fill in "Email" with "fake@gmail.com"
	And I fill in "Phone" with "911"
	And I fill in "user_password" with "asd123"
	And I fill in "Password Confirmation" with "asd123"
	And I press "Save Changes"
	Then I should see "Successfully created an account."
	And I should see "Logout"


Scenario: No login info provided at all

	And I press "Save Changes"
	Then I should see "There was an error in account creation."
	And I should see "7 errors"

Scenario: No name entered

	And I fill in "Email" with "fake@gmail.com"
	And I fill in "Phone" with "911"
	And I fill in "user_password" with "asd123"
	And I fill in "Password Confirmation" with "asd123"
	And I press "Save Changes"
	Then I should see "There was an error in account creation."
	And I should see "First name can't be blank"
	And I should see "Last name can't be blank"

Scenario: Invalid email address provided

	And I fill in "Email" with "test"
	And I press "Save Changes"
	Then I should see "There was an error in account creation."
	And I should see "Email is invalid"

Scenario: Insecure passwords provided

	And I fill in "user_password" with "test"
	And I fill in "Password Confirmation" with "test"
	And I press "Save Changes"
	Then I should see "There was an error in account creation."
	And I should see "Password is too short"