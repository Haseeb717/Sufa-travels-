class AddPaperclipToTransportExpenditure < ActiveRecord::Migration
  def self.up
    change_table :transport_expenditures do |t|
      t.attachment :image
    end
  end
end
