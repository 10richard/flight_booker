class BookingsController < ApplicationController
    def new
        redirect_to :root and return unless search?

        @booking = Booking.new
        @num_of_passengers = params[:tickets]
        @num_of_passengers.to_i.times { @booking.passengers.build}
        @flight = Flight.find_by(id: params[:flight_id])
        @departure_airport = @flight.departing_airport.code
        @arrival_airport = @flight.arriving_airport.code
        @flight_date = @flight.departure_date.strftime('%B %d, %Y')
    end

    def create
        @booking = Booking.new(booking_params)

        if @booking.save
            redirect_to @booking and return
        end
        render :new, status: :unprocessable_entity
    end

    def show
        @booking = Booking.find(params[:id])

    end

    private
    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end

    def search?
        return true if params[:commit] == 'Book'
    end
end
