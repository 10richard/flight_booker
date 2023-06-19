class FlightsController < ApplicationController

    def index
        @flights = Flight.all
        dates = Flight.select(:start)
        @dates = (dates.map {|d| d.start.strftime("%B %d, %Y")}).uniq
    end
end
