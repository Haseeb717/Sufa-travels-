class AddPaperclipToFoodExpenditure < ActiveRecord::Migration
  def self.up
    change_table :food_expenditures do |t|
      t.attachment :image
    end
  end
end
