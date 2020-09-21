class Flight < ApplicationRecord
  has_many :flight_passengers
  has_many :airline_flights

  has_many :passengers, through: :flight_passengers
  belongs_to :airline
end
