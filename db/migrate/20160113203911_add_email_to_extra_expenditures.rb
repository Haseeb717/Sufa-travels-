class AddEmailToExtraExpenditures < ActiveRecord::Migration
  def change
    add_column :extra_expenditures, :edit_request, :boolean, :default => false
    add_column :extra_expenditures, :edit_able, :boolean, :default => false
  end
end
