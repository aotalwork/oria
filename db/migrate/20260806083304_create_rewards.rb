class CreateRewards < ActiveRecord::Migration[8.1]
  def change
    create_table :rewards do |t|
      t.string :title
      t.text :description
      t.boolean :completed

      t.timestamps
    end
  end
end
