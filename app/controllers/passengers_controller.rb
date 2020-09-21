class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all
  end

  def destroy
    FlightPassenger.find_by(passenger_id: params[:id], flight_id: params[:flight_id]).delete
    redirect_to '/flights'
  end
end
