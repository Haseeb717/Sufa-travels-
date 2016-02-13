class AddEmailToTransportExpenditures < ActiveRecord::Migration
  def change
    add_column :transport_expenditures, :edit_request, :boolean, :default => false
    add_column :transport_expenditures, :edit_able, :booleann, :default => false
  end
end
