class Schedule < ApplicationRecord
  validates :week_day, presence: true
  validates :open_time, presence: true
  validates :close_time, presence: true
  belongs_to :saloon
  has_many :slots, dependent: :destroy
  has_many :schedule_slots
  scope :availableSchedulesForSaloon, ->(saloon_id) { where(saloon_id: saloon_id)}
  scope :availableScheduleForSaloonForToday, ->(saloon_id) { where(saloon_id: saloon_id, week_day: Date.today.wday)}
  require 'date'

  SUNDAY = 0
  MONDAY = 1
  TUESDAY = 2
  WEDNESDAY = 3
  THURSDAY = 4
  FRIDAY = 5
  SATURDAY = 6
end
