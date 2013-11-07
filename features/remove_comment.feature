Feature: Remove comment
	In order to remove a comment
	As a user
	I should be able to remove the comment if I am the author of that article

	Scenario: Removing a comment as the author of the article
		Given there is a user:
			| email					| password					|
			| markchav3z@gmail.com	| ilovethispassword			|
		And there is an article:
			| title 					| content 					|
			| sample title 				| sample content			|
		And there is a comment:
			| message 					|
			| hello world				|
		And I am on the homepage
		And I am logged in
		When I follow "sample title" link
		And I follow "remove comment" link
		Then I should not see "hello world"
		And I should see "Comment removed"

	Scenario: Trying to remove the comment of an article not owned
		Given there is a user:
			| email					| password					|
			| markchav3z@gmail.com	| ilovethispassword			|
		And I am on the homepage
		And I am logged in
		And there is a user:
			| email					| password					|
			| sampleuser@gmail.com	| damnthispassword			|
		And there is an article:
			| title					| content					|
			| Blog					| blogblogblog				|
		And there is a comment:
			| message				|
			| sample!				|
		And I am on the homepage
		When I follow "Blog" link
		Then I should not see "remove comment"
		

