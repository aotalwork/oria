class TaskStep < ApplicationRecord
  belongs_to :task

  validates :title, presence: true
  validates :description, presence: true
  validates :estimated_minutes,
            numericality: {
              only_integer: true,
              greater_than: 0,
              less_than: 10
            }
  validates :position, presence: true
end