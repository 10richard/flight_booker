# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#airports = Airport.create([{ code: 'NYC' }, { code: 'LAX' }, { code: 'MIA' }, { code: 'SFO' }, { code: 'DEN' }])
#Flight.create(departure_airport: 2, arrival_airport: 4, start: DateTime.now + 3.days, duration: 1)
#Flight.create(departure_airport: 3, arrival_airport: 1, start: DateTime.now + 6.days, duration: 3)
#Flight.create(departure_airport: 5, arrival_airport: 2, start: DateTime.now + 7.days, duration: 2)
#Flight.create(departure_airport: 4, arrival_airport: 1, start: DateTime.now + 10.days, duration: 5)
#Flight.create(departure_airport: 2, arrival_airport: 3, start: DateTime.now + 14.days, duration: 5)

#make flights available from each origin 

#duration is in minutes
AIRPORTS_AND_DURATIONS = {
    'NYC': { LAX: 356, MIA: 179, SFO: 374, DEN: 271, DAL: 216, EWR: 22 },
    'LAX': { NYC: 356, MIA: 288, SFO: 86, DEN: 145, DAL: 178, EWR: 309 },
    'MIA': { NYC: 179, LAX: 288, SFO: 341, DEN: 261, DAL: 162, EWR: 188 },
    'SFO': { NYC: 374, LAX: 86, MIA: 341, DEN: 152, DAL: 214, EWR: 316 },
    'DEN': { NYC: 271, LAX: 145, MIA: 261, SFO: 152, DAL: 156, EWR: 230 },
    'DAL': { NYC: 216, LAX: 178, MIA: 162, SFO: 214, DEN: 156, EWR: 213 },
    'EWR': { NYC: 22, LAX: 309, MIA: 188, SFO: 316, DEN: 230, DAL: 213 }
}.freeze

def seed_airports
    AIRPORTS_AND_DURATIONS.each_key { |airport_code| Airport.create( code: airport_code.to_s ) }
end

def seed_flight(depart_port, arrive_port, date, air_time)
    Flight.create(
        departure_airport: Airport.find_by(code: depart_port.to_s).id,
        arrival_airport: Airport.find_by(code: arrive_port.to_s).id,
        departure_date: date,
        departure_time: 'test',
        duration: air_time
    )
end

def get_rand_time
    Time.at(rand(0..23).hours + rand(0..59).minutes)
    'gyat'
end

def seed_rand_num_of_flights_on_day(d_code, arrivals, date)
    rand(0..5).times do 
        arrival = arrivals[rand(0..arrivals.count - 1)]
        seed_flight(d_code, arrival[0], date, arrival[1])
        arrivals.delete(arrival)
    end
end

def seed_flights
    current_date = Date.today
    (current_date..current_date + 1.month).each do |day|
        AIRPORTS_AND_DURATIONS.each do |departure_code, arrivals|
            seed_rand_num_of_flights_on_day(departure_code, arrivals.to_a, day)
        end
    end
end

Airport.destroy_all
Flight.destroy_all 
Airport.reset_pk_sequence
Flight.reset_pk_sequence
seed_airports
seed_flights