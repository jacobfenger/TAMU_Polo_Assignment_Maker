Feature: Sort Members or Officers

As an officer or member,
I want to be able to sort members or officers
So that I can easily find members to contact for website or update their role

Background: 

  Given the following users exist:
  | first_name              | last_name         | email         | role      | password      | password_confirmation
  | John                         | Smith                  | js@test.com        | Officer   | polo123            | polo123               
  | April                        | Great                  | ag@test.com        | Officer   | polo123            | polo123          
  | Harry                        | Rooster                | hr@test.com        | Officer   | polo123            | polo123          
  | Sally                        | Sals                   | ss@test.com        | Member    | polo123            | polo123          
  | George                       | Peters                 | gp@test.com        | Member    | polo123            | polo123          
  
  And I am logged into the officers panel
  
	

Scenario: View members and officers in table
	Given I am on the users page
	Then I should see "Members"
	And I should see "Officers"
	And I should see "Id"
	And I should see "Role"
	And I should see "First Name"
	And I should see "Last Name"
	And I should see "Email"
	And I should see "Phone"
	And I should see "Promote"
	And I should see "Demote"
	
Scenario: Sort by first name
  Given I am on the users page
  When I follow Officer's Table "First Name"
  Then I should see "April" before "John"

Scenario: Sort by last name
  Given I am on the users page
  When I follow Member's Table "Last Name"
  Then I should see "Peters" before "Sals"
  
Scenario: Sort by email
  Given I am on the users page
  When I follow Officer's Table "Email"
  Then I should see "April" before "John"