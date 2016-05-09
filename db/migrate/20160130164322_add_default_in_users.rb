class AddDefaultInUsers < ActiveRecord::Migration
  def change
  	change_column :users, :total_amount, :integer, :default => 0
  	change_column :users, :current_amount, :integer, :default => 0
  	change_column :users, :total_expenditures_amount, :integer, :default => 0
  end
end
