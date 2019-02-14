@javascript
Feature: Car owner can rent out car

    As a car owner
    In order to rent my car out to users
    I want to be able to register my car on the website

    Background: 
        Given the following user exists
            | email          |
            | real@mail.com |
        And I am logged in as 'real@mail.com'
        And I click "View Profile"
        And I click "Add Car"

    Scenario: Car owner can succesfully rent out car
        And I wait 4 seconds
        And I select "Volvo" from "Brand"
        And I select "2010" from "Year"
        And I wait 2 seconds
        And I select "V70" from "Model"
        And I fill in "Price" field with "200"
        And I click "Save Car"
        Then I should see "Car succesfully added"
        And I should see "Volvo V70"
        And I should see "Year: 2010"
        And I should see "Price: 200 SEK per day"

    Scenario: When car owner fills out rent form unsuccessfully he gets an error message
        When I click "Save Car"
        Then I should see "Brand can't be blank"
        And I should see "Model can't be blank"
        And I should see "Year can't be blank"
        And I should see "Price can't be blank"
