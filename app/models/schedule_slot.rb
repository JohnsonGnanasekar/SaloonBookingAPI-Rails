class ScheduleSlot < ApplicationRecord
  belongs_to :schedule
  belongs_to :chair
  belongs_to :slot
  has_many :booking_slots
  scope :availableScheduleSlot, -> { where(book_status: 0)}
end
