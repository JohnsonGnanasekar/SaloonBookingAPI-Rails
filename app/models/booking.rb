class Booking < ApplicationRecord
  belongs_to :saloon
  belongs_to :service
  belongs_to :chair
  #--------added for join table
  has_many :booking_slots
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  private

end
