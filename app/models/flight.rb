class Flight < ApplicationRecord
    
    belongs_to :departing_airport, class_name: 'Airport', foreign_key: 'departure_airport'
    belongs_to :arriving_airport, class_name: 'Airport', foreign_key: 'arrival_airport'
    has_many :bookings

    def self.user_search(query_params)
        where(departure_airport: query_params[:origin_id],
              arrival_airport: query_params[:dest_id],
              departure_date: query_params[:flight_date])
    end
end
