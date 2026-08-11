class RenameEstimatedTimeToEstimatedMinutesOnProcrastinations < ActiveRecord::Migration[8.0]
  def change
    rename_column :procrastinations, :estimated_time, :estimated_minutes
  end
end
