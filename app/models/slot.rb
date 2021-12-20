class Slot < ApplicationRecord
  belongs_to :schedule
  has_many :schedule_slots
  validates :start_time, presence: true
  validates :end_time, presence: true
end
