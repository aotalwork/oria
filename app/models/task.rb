class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  enum :status, {
    pending: "pending",
    completed: "completed"
  }, default: :pending
end