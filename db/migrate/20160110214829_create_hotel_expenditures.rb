class CreateHotelExpenditures < ActiveRecord::Migration
  def change
    create_table :hotel_expenditures do |t|
      t.float :expenditure_type
      t.datetime :checked_in_date
      t.datetime :checked_out_date
      t.integer :total_days
      t.integer :charges_per_day
      t.integer :no_of_rooms
      t.integer :room_type
      t.float :total_amount
      t.string :hotel_name
      t.references :user, index: true, foreign_key: true
      t.text :comments

      t.timestamps null: false
    end
  end
end
