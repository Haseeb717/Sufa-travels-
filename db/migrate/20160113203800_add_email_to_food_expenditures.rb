class AddEmailToFoodExpenditures < ActiveRecord::Migration
  def change
    add_column :food_expenditures, :edit_request, :boolean, :default => false
    add_column :food_expenditures, :edit_able, :boolean, :default => false
  end
end
