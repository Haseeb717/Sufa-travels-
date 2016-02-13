class AddColumnToTransportExpenditure < ActiveRecord::Migration
  def change
    add_column :transport_expenditures, :voucher_reference, :string
    add_column :transport_expenditures, :guest_name, :string
    add_column :transport_expenditures, :supplier_name, :string

  end
end
