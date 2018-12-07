class AddFeatureColumnsToAutomobile < ActiveRecord::Migration[5.2]
  def change
    add_column :automobiles, :description, :string
    add_column :automobiles, :engine, :string
    add_column :automobiles, :rental_status, :boolean, default: false
  end
end
