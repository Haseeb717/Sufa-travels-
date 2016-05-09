class AddNoOfBedsColumnToHotelExpenditure < ActiveRecord::Migration
  def change
    add_column :hotel_expenditures, :no_of_beds, :integer
  end
end
