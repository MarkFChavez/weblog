Feature: Removing articles
	In order to remove an article
	As a user
	I should be the author of the article

	Background:
		Given there is a user:
			| email 					| password 					|
			| markchav3z@gmail.com		| mypassword				|
		And there is an article:
			| title 					| content 					|
			| Sample Title 				| lorem ipsum				|
		And I am on the homepage
		And I am logged in 

	Scenario: Removing your article
		When I follow "Sample Title" link
		And I follow "Remove this article" link
		Then I should see "Article removed successfully"
		And I should not see "Sample Title"

	Scenario: Removing an article you do not own
		And there is a user:
			| email 					| password 					|
			| sampleuser@gmail.com		| mypassword				|
		And there is an article:
			| title 					| content 					|
			| Lorem Ipsum				| lorem ipsum				|
		And I am on the homepage
		When I follow "Lorem Ipsum" link
		Then I should not see "Remove this article"