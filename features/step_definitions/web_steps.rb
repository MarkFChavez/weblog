
Given /^there is a user:$/ do |table|
	table.hashes.each do |attributes|
		@user = FactoryGirl.create(:user, attributes)
	end
end

Given /^there is an article:$/ do |table|
	table.hashes.each do |attributes|
		@article = FactoryGirl.create(:article, attributes.merge(user: @user))
	end
end

Given /^there is a comment:$/ do |table|
	table.hashes.each do |attributes|
		@comment = FactoryGirl.create(:comment, attributes.merge(user: @user, article: @article))
	end
end

Given /^I am on the homepage$/ do 
	visit root_path
end

Given /^I am logged in$/ do
	steps %{
		When I follow "Login" link 
		And I fill in "Email" with "#{@user.email}" 
		And I fill in "Password" with "#{@user.password}" 
		And I follow "Sign in" button 
		Then I should see "Hi #{@user.email}" 
	}
end

When /^I follow "(.*?)" (link|button)$/ do |text, target|
	if target == "link"
		click_link text
	else
		click_button text
	end
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
	fill_in field, with: value
end

Then /^I should see "(.*?)"$/ do |text|
	page.should have_content(text)
end

Then /^I should not see "(.*?)"$/ do |text|
	page.should_not have_content(text)
end