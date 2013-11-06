Feature: Creating Articles
	In order to create an article
	As a user
	I should be logged in

	Background:
		Given there is a user:
			| email					| password					|
			| markchav3z@gmail.com	| ilovethispassword			|
		And I am on the homepage
		And I am logged in

	Scenario: Creating a valid article
		When I follow "Create an article" link
		And I fill in "Title" with "Sample Title"
		And I fill in "Content" with "This is a sample content used for my testing"
		And I follow "Create Article" button
		Then I should see "Article created successfully"
		And I should see "Sample Title"

	Scenario: Creating an article without a title
		When I follow "Create an article" link
		And I follow "Create Article" button
		And I should see "Title can't be blank"

	Scenario: Creating an article with an already existing title
		Given there is an article:
			| title 					| content 					|
			| sample title 				| hello world! 				|
		When I follow "Create an article" link
		And I fill in "Title" with "sample title"
		And I fill in "Content" with "This is a sample content used for my testing"
		And I follow "Create Article" button
		And I should see "Title has already been taken"