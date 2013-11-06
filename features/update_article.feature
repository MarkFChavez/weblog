Feature: Updating an article
	In order to update an article
	As a user
	I should be authenticated and must be the author of that article

	Background:
		Given there is a user:
			| email 					| password 					|
			| markchav3z@gmail.com		| mypassword				|
		And there is an article:
			| title 					| content 					|
			| Sample Title 				| lorem ipsum				|
		And I am on the homepage
		And I am logged in

	Scenario: Update the article
		When I follow "Sample Title" link
		And I follow "Edit this article" link
		And I fill in "Title" with "New Title"
		And I fill in "Content" with "new content"
		And I follow "Update Article" button
		Then I should see "Article updated successfully"
		And I should see "New Title"
		And I should see "new content"

	Scenario: Update the article without a title
		When I follow "Sample Title" link
		And I follow "Edit this article" link
		And I fill in "Title" with ""
		And I fill in "Content" with "new content"
		And I follow "Update Article" button
		Then I should see "Title can't be blank"

	Scenario: Updating an article that you do not own
		And there is a user:
			| email 					| password 					|
			| sampleuser@gmail.com		| mypassword				|
		And there is an article:
			| title 					| content 					|
			| Lorem Ipsum				| lorem ipsum				|
		And I am on the homepage
		When I follow "Lorem Ipsum" link
		Then I should not see "Edit this article"