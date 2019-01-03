class AddAutomobileRefToRental < ActiveRecord::Migration[5.2]
  def change
    add_reference :rentals, :automobile, foreign_key: true
  end
end
