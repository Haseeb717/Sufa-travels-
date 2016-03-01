class AddRecievedToAdminBalances < ActiveRecord::Migration
  def change
    add_column :user_balances, :admin_approved, :boolean,:default=>false
  end
end
