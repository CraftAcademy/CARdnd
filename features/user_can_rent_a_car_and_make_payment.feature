@javascript
Feature: User can select a car to rent and make payment

    As a car renter
    In order to be able to rent a car
    I want to rent from the available cars

    As a car renter
    In order to be able to rent a car
    I want to pay for the car

    Background:
        Given the following user exists
            | email            | first_name |
            | owner@email.com  | Greg       |
            | renter@email.com | Don        |
        And The following cars exist
            | brand | model | year | price | user |
            | Volvo | V60   | 2010 | 200   | Greg |
            | BMW   | BM56  | 2020 | 700   | Greg |
        And I am logged in as "renter@email.com"

    Scenario: User can pay rent after selecting a car
        Given I click "Dream" within "BMW"
        And I click "Drive this car"
        And I wait 3 seconds
        And I fill in the payment form
        And I submit the payment form
        And I wait 3 seconds
        Then I should see "Your purchase is successful"
        And I should see "Rented out"
        And I click "View Profile"
        Then I should see "BMW BM56 700 SEK from: Greg"
        And I should see "Your total spending: 700 SEK"
        And I am logged in as "owner@email.com"
        And I click "View Profile"
        Then I should see "BMW BM56 700 SEK to: Don"
        And I should see "Your total earnings: 700 SEK"