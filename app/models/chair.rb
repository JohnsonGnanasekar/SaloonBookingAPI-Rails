class Chair < ApplicationRecord
  belongs_to :saloon
  has_many :schedule_slots
  scope :availableChairsForSaloon, ->(saloon_id) { where(saloon_id: saloon_id)}
  validates :saloon_chair_id, presence: true
end
