class CreateRoutines < ActiveRecord::Migration[8.1]
  def change
    create_table :routines do |t|
      t.string :name
      t.string :period
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
