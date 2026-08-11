class CreateAiTaskBreakdowns < ActiveRecord::Migration[8.1]
  def change
    create_table :ai_task_breakdowns do |t|
      t.references :task, null: false, foreign_key: true
      t.text :response

      t.timestamps
    end
  end
end
