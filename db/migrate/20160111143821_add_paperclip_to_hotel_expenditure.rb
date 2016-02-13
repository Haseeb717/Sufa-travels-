class AddPaperclipToHotelExpenditure < ActiveRecord::Migration
  def self.up
    change_table :hotel_expenditures do |t|
      t.attachment :image
    end
  end
end
