require 'rails_helper'

RSpec.describe "passengers index" do
  describe "shows all passengers" do
    it "as well as passengers flight count" do
      airline = Airline.create!(name: 'Frontier')
      flight = airline.flights.create!(flight_number: 4, airline_id: airline.id)
      flight.passengers.create(name: "John", age: 28)
      flight.passengers.create(name: "Mary", age: 29)
      flight.passengers.create(name: "Terry", age: 43)
      flight.passengers.create(name: "Gary", age: 68)
      flight.passengers.create(name: "Larry", age: 18)
      flight.passengers.create(name: "Jerry", age: 35)
      flight = airline.flights.create!(flight_number: 7, airline_id: airline.id)
      flight.passengers.create(name: "Millie", age: 28)
      flight.passengers.create(name: "Willie", age: 29)
      flight.passengers.create(name: "Billie", age: 43)
      flight.passengers.create(name: "Gill", age: 68)
      flight.passengers.create(name: "Bill", age: 18)
      flight.passengers.create(name: "Will", age: 35)

      visit "/airlines/#{airline.id}"


      expect(page).to have_content("John")
      expect(page).to have_content("Mary")
      expect(page).to have_content("Terry")
      expect(page).to have_content("Gary")
      expect(page).to have_content("Larry")
      expect(page).to have_content("Jerry")
      expect(page).to have_content("Millie")
      expect(page).to have_content("Willie")
      expect(page).to have_content("Billie")
      expect(page).to have_content("Gill")
      expect(page).to have_content("Bill")
      expect(page).to have_content("Will")
    end
  end
end
