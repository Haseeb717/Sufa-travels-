class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_amount, :float
    add_column :users, :current_amount, :float
    add_column :users, :total_expenditures_amount, :float
  end
end
