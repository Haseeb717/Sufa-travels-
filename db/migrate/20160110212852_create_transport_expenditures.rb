class CreateTransportExpenditures < ActiveRecord::Migration
  def change
    create_table :transport_expenditures do |t|
      t.integer :transport_type
      t.string :expenditure_type
      t.integer :no_of_seats
      t.timestamps :arrival_time
      t.timestamps :departure_time
      t.string :arrival_place
      t.string :departure_place
      t.float :payment
      t.text :comments
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
