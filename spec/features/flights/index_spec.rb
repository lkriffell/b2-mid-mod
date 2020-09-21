require 'rails_helper'

RSpec.describe "Flights index" do
  describe "shows all flights" do
    it "as well as passengers" do
      airline = Airline.create!(name: 'Frontier')
      flight = airline.flights.create!(flight_number: 4, airline_id: airline.id)
      flight.passengers.create(name: "John", age: 28)
      flight.passengers.create(name: "Mary", age: 29)
      flight.passengers.create(name: "Terry", age: 43)
      flight.passengers.create(name: "Gary", age: 68)
      flight.passengers.create(name: "Larry", age: 18)
      flight.passengers.create(name: "Jerry", age: 35)

      visit '/flights'

      expect(page).to have_content("Flight Number: #{flight.flight_number}")
      expect(page).to have_content("John")
      expect(page).to have_content("Mary")
      expect(page).to have_content("Terry")
      expect(page).to have_content("Gary")
      expect(page).to have_content("Larry")
      expect(page).to have_content("Jerry")
    end
    it "as well as links to remove passengers" do
      airline = Airline.create!(name: 'Frontier')
      flight = airline.flights.create!(flight_number: 4, airline_id: airline.id)
      john = flight.passengers.create(name: "John", age: 28)
      flight.passengers.create(name: "Mary", age: 29)
      flight.passengers.create(name: "Terry", age: 43)
      flight.passengers.create(name: "Gary", age: 68)
      flight.passengers.create(name: "Larry", age: 18)
      flight.passengers.create(name: "Jerry", age: 35)
      flight = airline.flights.create!(flight_number: 7, airline_id: airline.id)
      flight.passengers.create(name: "Mary", age: 29)
      flight.passengers.create(name: "Terry", age: 43)
      flight.passengers.create(name: "Gary", age: 68)
      flight.passengers.create(name: "Larry", age: 18)
      flight.passengers.create(name: "Jerry", age: 35)

      visit '/flights'

      within "#passenger-#{john.id}" do
        expect(page).to have_link("Remove Passenger")
        click_link "Remove Passenger"
      end

      expect(current_path).to eq('/flights')
      expect(page).to_not have_content("John")
    end
  end
end
