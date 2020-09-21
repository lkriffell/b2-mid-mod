class AirlineFlight < ApplicationRecord
  belongs_to :airline
  belongs_to :flight
end
