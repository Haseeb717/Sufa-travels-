class AddEmailToDailyBalances < ActiveRecord::Migration
  def change
    add_column :daily_balances, :expense, :integer,:default=>0
    add_column :daily_balances, :balance_added, :integer,:default=>0
  end
end
