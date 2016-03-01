class AddRecievedToUserBalances < ActiveRecord::Migration
  def change
    add_column :user_balances, :recieved, :boolean,:default=>false
  end
end
