class AddColumnToFoodExpenditure < ActiveRecord::Migration
  def change
    add_column :food_expenditures, :voucher_reference, :string
    add_column :food_expenditures, :guest_name, :string
    add_column :food_expenditures, :on_request_of, :string
  
  end
end
