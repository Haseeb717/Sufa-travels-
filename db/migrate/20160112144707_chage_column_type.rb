class ChageColumnType < ActiveRecord::Migration
  def change
  	change_column :hotel_expenditures, :expenditure_type,  :string
  end
end
