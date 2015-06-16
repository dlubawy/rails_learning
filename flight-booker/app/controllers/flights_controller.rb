class FlightsController < ApplicationController
  def index
    @airport_codes = Airport.all.collect {|a| [a.airport_code, a.id]}
    @num_passengers = (1..4).to_a.collect {|x| [x, x]}
    @dates = Flight.order(datetime: :desc).collect {|d| [d.datetime]}.uniq
  end
end
