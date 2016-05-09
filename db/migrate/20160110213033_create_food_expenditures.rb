class CreateFoodExpenditures < ActiveRecord::Migration
  def change
    create_table :food_expenditures do |t|
      t.integer :food_type
      t.string :expenditure_type
      t.string :hotel_name
      t.float :payment
      t.integer :no_of_persons
      t.text :comments
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
