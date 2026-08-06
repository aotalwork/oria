class CreateStudyNotes < ActiveRecord::Migration[8.1]
  def change
    create_table :study_notes do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
