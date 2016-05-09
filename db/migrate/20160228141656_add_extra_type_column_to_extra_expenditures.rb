class AddExtraTypeColumnToExtraExpenditures < ActiveRecord::Migration
  def change
    add_column :extra_expenditures, :extra_type, :integer
    add_column :extra_expenditures, :other_reason, :string
  end
end
