class Saloon < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :chairs, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :slots, through: :schedules

  validates :name, presence: true
  validates :address, presence: true
end
