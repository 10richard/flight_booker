class Flight < ApplicationRecord
    belongs_to :airport, optional: true

    def self.user_search(query_params)
        where(departure_airport: query_params[:origin_id],
              arrival_airport: query_params[:dest_id],
              departure_date: query_params[:flight_date])
    end
end
