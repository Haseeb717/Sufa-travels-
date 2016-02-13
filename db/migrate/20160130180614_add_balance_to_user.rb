class AddBalanceToUser < ActiveRecord::Migration
  def change
    add_column :users, :balance_request, :integer
  end
end
