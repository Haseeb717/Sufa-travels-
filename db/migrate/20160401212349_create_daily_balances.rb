class CreateDailyBalances < ActiveRecord::Migration
  def change
    create_table :daily_balances do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :opening_balance,:default=>0
      t.integer :closing_balance,:default=>0

      t.timestamps null: false
    end
  end
end
