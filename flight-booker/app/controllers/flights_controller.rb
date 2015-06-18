class FlightsController < ApplicationController
  def index
    @flights = Flight.search(params)
    @airport_codes = Airport.all.collect {|a| [a.airport_code, a.id]}.uniq
    @num_passengers = (1..4).to_a.collect {|x| [x, x]}
    @dates = Flight.flight_dates
  end
end
