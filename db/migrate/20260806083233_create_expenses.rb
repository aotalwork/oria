class CreateExpenses < ActiveRecord::Migration[8.1]
  def change
    create_table :expenses do |t|
      t.decimal :amount
      t.string :category
      t.string :description
      t.date :spent_on

      t.timestamps
    end
  end
end
