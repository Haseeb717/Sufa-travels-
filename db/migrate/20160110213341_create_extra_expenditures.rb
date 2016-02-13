class CreateExtraExpenditures < ActiveRecord::Migration
  def change
    create_table :extra_expenditures do |t|
      t.float :payment
      t.string :expenditure_type
      t.references :user, index: true, foreign_key: true
      t.text :reason
      

      t.timestamps null: false
    end
  end
end
