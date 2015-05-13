Feature: Manage Articles
	In order to see my events
	As a public user
	I want to log in

	Scenario: Logged In
		Given I am a user
		When I go to the home page
		Then I should see my name on the navbar that shows I'm logged in.