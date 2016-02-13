class AddPaperclipToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :image
    end
  end
end
