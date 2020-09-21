class CreateAirlineFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :airline_flights do |t|
      t.references :airline, foreign_key: true
      t.references :flight, foreign_key: true
    end
  end
end
