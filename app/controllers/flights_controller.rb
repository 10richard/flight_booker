class FlightsController < ApplicationController

    def index
        @flights = Flight.all
        @dates = Flight.select(:departure_date).distinct
        @origin_airport = Airport.find_by(id: params[:origin_id])
        @arrival_airport = Airport.find_by(id: params[:dest_id])
        @flight_date = params[:flight_date]
        @available_flights = Flight.user_search(query_params)
    end

    private
    def query_params
        params.permit(:origin_id, :dest_id, :flight_date, :tickets)
    end
end
