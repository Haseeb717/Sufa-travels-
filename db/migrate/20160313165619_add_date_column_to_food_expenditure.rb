class AddDateColumnToFoodExpenditure < ActiveRecord::Migration
  def change
    add_column :food_expenditures, :date, :string
  end
end
