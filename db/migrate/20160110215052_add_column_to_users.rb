class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_amount, :double
    add_column :users, :current_amount, :double
    add_column :users, :total_expenditures_amount, :double
  end
end
