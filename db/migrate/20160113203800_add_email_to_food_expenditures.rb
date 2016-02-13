class AddEmailToFoodExpenditures < ActiveRecord::Migration
  def change
    add_column :food_expenditures, :edit_request, :booleann, :default => false
    add_column :food_expenditures, :edit_able, :booleann, :default => false
  end
end
