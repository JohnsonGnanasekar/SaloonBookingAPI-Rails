class BookingSlot < ApplicationRecord
  belongs_to :booking
  belongs_to :schedule_slot
end
