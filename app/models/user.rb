class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :tasks, dependent: :destroy
  has_many :routines, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :study_notes, dependent: :destroy
  has_many :sleep_logs, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many :message_drafts, dependent: :destroy
end
