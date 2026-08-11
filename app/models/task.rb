class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  has_one :ai_task_breakdown, dependent: :destroy

  has_many :task_steps, dependent: :destroy

  enum :status, {
    pending: "pending",
    completed: "completed"
  }, default: :pending
end