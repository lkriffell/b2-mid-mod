require 'rails_helper'

RSpec.describe "passengers index" do
  describe "shows all passengers" do
    it "as well as passengers flight count" do
      airline = Airline.create!(name: 'Frontier')
      flight = airline.flights.create!(flight_number: 4, airline_id: airline.id)
      john = flight.passengers.create(name: "John", age: 28)
      mary = flight.passengers.create(name: "Mary", age: 29)
      flight.passengers.create(name: "Terry", age: 43)
      flight.passengers.create(name: "Gary", age: 68)
      flight.passengers.create(name: "Larry", age: 18)
      flight.passengers.create(name: "Jerry", age: 35)
      flight = airline.flights.create!(flight_number: 7, airline_id: airline.id)
      flight.flight_passengers.create(passenger_id: john.id)
      flight.flight_passengers.create(passenger_id: mary.id)
      flight.passengers.create(name: "Willie", age: 29)
      flight.passengers.create(name: "Billie", age: 43)
      flight.passengers.create(name: "Gill", age: 68)
      flight.passengers.create(name: "Bill", age: 18)
      flight.passengers.create(name: "Will", age: 35)

      visit "/passengers"


      expect(page).to have_content("John - flights: 2")
      expect(page).to have_content("Mary - flights: 2")
      expect(page).to have_content("Terry - flights: 1")
      expect(page).to have_content("Gary - flights: 1")
      expect(page).to have_content("Larry - flights: 1")
      expect(page).to have_content("Jerry - flights: 1")
      expect(page).to have_content("Willie - flights: 1")
      expect(page).to have_content("Billie - flights: 1")
      expect(page).to have_content("Gill - flights: 1")
      expect(page).to have_content("Bill - flights: 1")
      expect(page).to have_content("Will - flights: 1")
    end
  end
end
