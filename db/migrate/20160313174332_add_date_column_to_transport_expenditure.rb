class AddDateColumnToTransportExpenditure < ActiveRecord::Migration
  def change
    add_column :transport_expenditures, :date, :string
  end
end
