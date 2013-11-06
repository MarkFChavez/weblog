Feature: Login and Logout
	In order to use the appication
	As a user
	I should be able to login and logout of the application

	Background:
		Given there is a user:
			| email					| password					|
			| markchav3z@gmail.com	| validpassword				|
		And I am on the homepage

	Scenario: Login w/ valid credentials
		When I follow "Login" link
		And I fill in "Email" with "markchav3z@gmail.com"
		And I fill in "Password" with "validpassword"
		And I follow "Sign in" button
		Then I should see "Hi markchav3z@gmail.com"
		And I should see "Logout"

	Scenario: Login w/ invalid credentials
		When I follow "Login" link
		And I fill in "Email" with "markchav3z@gmail.com"
		And I fill in "Password" with "invalidpassword"
		And I follow "Sign in" button
		Then I should see "Invalid email or password"

	Scenario: Logging out
		Given I am logged in
		When I follow "Logout" link
		Then I should not see "Hi markchav3z@gmail.com"
		And I should see "Login"