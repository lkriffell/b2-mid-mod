require 'rails_helper'

RSpec.describe Passenger do
  describe 'relationships' do
    it { should have_many(:flights).through(:flight_passengers) }
  end
  describe 'model methods' do
    it "flight_count" do
      airline = Airline.create!(name: 'Frontier')
      flight = airline.flights.create!(flight_number: 4, airline_id: airline.id)
      john = flight.passengers.create(name: "John", age: 28)

      expect(john.flight_count).to eq(1)
    end
  end
end
