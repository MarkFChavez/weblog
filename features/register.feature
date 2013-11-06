Feature: Register
	In order to use the application
	As a user
	I should create an account first

	Scenario: Register w/ valid credentials
		Given I am on the homepage
		And I follow "Register" link
		When I fill in "Email" with "markchav3z@gmail.com"
		And I fill in "Password" with "myvalidpassword"
		And I fill in "Password confirmation" with "myvalidpassword"
		And I follow "Sign up" button
		Then I should see "Welcome! You have signed up successfully."
		And I should see "Hi markchav3z@gmail.com"

	Scenario: Register w/ invalid credentials
		Given I am on the homepage
		And I follow "Register" link
		When I fill in "Email" with "markchav3z@gmail.com"
		And I fill in "Password" with "myvalidpassword"
		And I fill in "Password confirmation" with "thisiswrongpass"
		And I follow "Sign up" button
		And I should not see "Hi markchav3z@gmail.com"