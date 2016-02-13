class AddEmailToHotelExpenditures < ActiveRecord::Migration
  def change
    add_column :hotel_expenditures, :edit_request, :boolean, :default => false
    add_column :hotel_expenditures, :edit_able, :booleann, :default => false
  end
end
