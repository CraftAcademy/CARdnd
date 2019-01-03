Feature: Visitor can see all cars available for rent
    As a visitor
    In order to rent a car
    I want to see all the cars available for rent when I visit the site

    Background:
        Given the following user exists
            | first_name |
            | Greg       |
        Given The following cars exist
            | brand | model | year | price | user |
            | Volvo | V60   | 2010 | 200   | Greg |
            | Audi  | Q2    | 2018 | 300   | Greg |

    Scenario: View list of cars on landing page
        Given I visit the landing page
        Then I should see "Volvo V60"
        And I should see "Year: 2010" within "Volvo V60"
        And I should see "Price: 200 SEK per day" within "Volvo V60"
        Then I should see "Audi Q2"
        And I should see "Year: 2018" within "Audi Q2"
        And I should see "Price: 300 SEK per day" within "Audi Q2"