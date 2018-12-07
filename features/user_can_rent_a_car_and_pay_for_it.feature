@javascript @stripe
Feature: User can rent a car and pay for it

    Feature Description


    Background:
        Given the following user exists
            | email                | first_name |
            | renter@email.com     | Renter     |
            | client_new@email.com | Client     |

        And the following cars exist
            | brand | model | year | price | user   |
            | Volvo | V60   | 2010 | 200   | Renter |
            | Audi  | Q2    | 2018 | 300   | Renter |

        And I am logged in as "client_new@email.com"

    Scenario: Select car and pay for rent
        Given I visit the landing page
        And I click on "Rent" for "Audi"
        And I wait 3 seconds
        And I fill in the payment form
        And submit the payment form
        And I wait 2 seconds
        Then I should see "You just rented an AUDI!"
