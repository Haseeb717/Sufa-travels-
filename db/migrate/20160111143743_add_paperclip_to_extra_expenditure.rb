class AddPaperclipToExtraExpenditure < ActiveRecord::Migration
  def self.up
    change_table :extra_expenditures do |t|
      t.attachment :image
    end
  end
end
