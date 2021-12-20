class Service < ApplicationRecord
  belongs_to :saloon
  scope :availableServicesForSaloon, ->(saloon_id) { where(saloon_id: saloon_id)}
  validates :name, presence: true
  validates :duration, presence: true
  validates :cost, presence: true
end
