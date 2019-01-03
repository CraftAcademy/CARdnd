Feature: Visitor can see specific car information
    As a visitor
    In order to rent a car
    I want to see more information about specific car I have selected

    Background:
        Given the following user exists
            | first_name |
            | Greg       |
        Given The following cars exist
            | brand | model | year | price | description  | engine | rental_status | user |
            | Volvo | V60   | 2010 | 200   | Great car!   | V6     | false         | Greg |
            | BMW   | E-6   | 2011 | 500   | Almost a car | V8     | true          | Greg |
        And I visit the landing page

    Scenario: View specific car on show page - see rent this car link if available for rental
        Then I should see "Volvo V60"
        And I click "Dream" within "Volvo V60"
        And I should see "Year: 2010" within "Volvo V60"
        And I should see "Price: 200 SEK per day" within "Volvo V60"
        And I should see "Great car!" within "Volvo V60"
        And I should see "V6" within "Volvo V60"
        And I should see "Drive this car" within "Volvo V60"

    Scenario: View specific car on show page - no rent this car link if not available for rental
        Then I should see "BMW"
        And I click "Dream" within "BMW"
        And I should see "Year: 2011" within "BMW"
        And I should see "Price: 500 SEK per day" within "BMW"
        And I should see "Almost a car" within "BMW"
        And I should see "V8" within "BMW"
        And I should see "Currently rented" within "BMW"