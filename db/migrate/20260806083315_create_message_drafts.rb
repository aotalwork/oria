class CreateMessageDrafts < ActiveRecord::Migration[8.1]
  def change
    create_table :message_drafts do |t|
      t.string :subject
      t.string :recipient
      t.text :content

      t.timestamps
    end
  end
end
