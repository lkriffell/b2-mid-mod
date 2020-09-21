class Airline < ApplicationRecord
  has_many :airline_flights

  has_many :airline_flights
  has_many :flights, through: :airline_flights
end
