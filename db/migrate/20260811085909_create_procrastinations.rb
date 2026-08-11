class CreateProcrastinations < ActiveRecord::Migration[8.1]
  def change
    create_table :procrastinations do |t|
      t.string :task
      t.text :first_step
      t.integer :estimated_time
      t.text :motivation
      t.text :blocker_plan

      t.timestamps
    end
  end
end
