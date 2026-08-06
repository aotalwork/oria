class CreateSleepLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :sleep_logs do |t|
      t.datetime :slept_at
      t.datetime :woke_at
      t.integer :quality
      t.text :notes

      t.timestamps
    end
  end
end
