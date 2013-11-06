Feature: Reading an article
	In order to view an article
	As a user
	I should be click the article link

	Background:
		Given there is a user:
			| email 					| password						|
			| markchav3z@gmail.com		| mypassword					|
		And there is an article:
			| title 					| content 						|
			| Hello						| hello there!					|
		And I am on the homepage

	Scenario: Clicking the article title
		When I follow "Hello" link
		Then I should see "Title: Hello"
		And I should see "Posted by markchav3z@gmail.com"
