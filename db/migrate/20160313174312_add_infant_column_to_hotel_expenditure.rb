class AddInfantColumnToHotelExpenditure < ActiveRecord::Migration
  def change
    add_column :hotel_expenditures, :infant, :integer
  end
end
