class AddColumnToHotelExpenditures < ActiveRecord::Migration
  def change
    add_column :hotel_expenditures, :no_of_persons, :integer
    add_column :hotel_expenditures, :adults, :integer
    add_column :hotel_expenditures, :children, :integer
  end
end
