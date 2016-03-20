class AddColumnNameToHotelExpenditure < ActiveRecord::Migration
  def change
    add_column :hotel_expenditures, :d_room_type, :integer
    add_column :hotel_expenditures, :t_room_type, :integer
    add_column :hotel_expenditures, :q_room_type, :intger
    add_column :hotel_expenditures, :d_rooms, :integer,:default=>0
    add_column :hotel_expenditures, :t_rooms, :integer,:default=>0
    add_column :hotel_expenditures, :q_rooms, :integer,:default=>0
    add_column :hotel_expenditures, :charge_d_room, :integer,:default=>0
    add_column :hotel_expenditures, :charge_t_room, :integer,:default=>0
    add_column :hotel_expenditures, :charge_q_room, :integer,:default=>0
  end
end
