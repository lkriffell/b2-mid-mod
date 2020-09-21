class AirlinesController < ApplicationController

  def show
    @airline = Airline.find(params[:id])
    @airline_passengers = FlightPassenger.where(flight_id: @airline.flights)
    @airline_passengers = @airline_passengers.map do |airline_passenger|
      Passenger.find(airline_passenger.passenger_id)
    end.uniq
  end
end
