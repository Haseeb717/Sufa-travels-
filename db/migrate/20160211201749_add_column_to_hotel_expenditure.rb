class AddColumnToHotelExpenditure < ActiveRecord::Migration
  def change
    add_column :hotel_expenditures, :voucher_reference, :string
    add_column :hotel_expenditures, :guest_name, :string
    add_column :hotel_expenditures, :supplier_name, :string
    add_column :hotel_expenditures, :room_basis, :integer
 
  end
end
