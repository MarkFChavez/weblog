Feature: Adding comments
	In order to add comments on an article
	As a user
	I should be on the article page and authenticated

	Scenario: Adding comment when logged in
		Given there is a user:
			| email 					| password 					|
			| markchav3z@gmail.com		| mypassword				|
		And there is an article:
			| title 					| content 					|
			| Sample Title 				| lorem ipsum				|
		And I am on the homepage
		And I am logged in
		And I follow "Sample Title" link
		And I fill in "comment_message" with "sample comment"
		And I follow "Add Comment" button
		Then I should see "Comment added successfully"
		And I should see "sample comment"
		And I should see "View 1 comment"

	Scenario: Adding comment when logged out
		Given there is a user:
			| email 					| password 					|
			| markchav3z@gmail.com		| mypassword				|
		And there is an article:
			| title 					| content 					|
			| Sample Title 				| lorem ipsum				|
		And I am on the homepage
		When I follow "Sample Title" link
		Then I should see "Sign in to add comments"
