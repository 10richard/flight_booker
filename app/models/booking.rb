class Booking < ApplicationRecord
    validates :flight_id, presence: true

    belongs_to :flight
    has_many :passengers
end
