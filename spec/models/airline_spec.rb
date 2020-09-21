require 'rails_helper'

RSpec.describe Airline do
  describe 'relationships' do
    it { should have_many(:flights).through(:airline_flights) }
  end
end
