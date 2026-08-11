class CreateTaskSteps < ActiveRecord::Migration[8.1]
  def change
    create_table :task_steps do |t|
      t.references :task, null: false, foreign_key: true
      t.integer :position
      t.string :title
      t.text :description
      t.integer :estimated_minutes

      t.timestamps
    end
  end
end
