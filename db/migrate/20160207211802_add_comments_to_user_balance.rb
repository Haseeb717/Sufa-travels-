class AddCommentsToUserBalance < ActiveRecord::Migration
  def change
    add_column :user_balances, :comments, :string
  end
end
