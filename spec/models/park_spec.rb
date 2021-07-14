require 'rails_helper'

RSpec.describe Park do
  describe 'relationships' do
    it {should belong_to(:state)}
  end

  describe 'class methods' do
    before(:each) do
      @state_1 = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 42)
      @park_1 = @state_1.parks.create!(name: 'Ginny Springs', camping_allowed: true, kayaking_available: true, park_rating: 4.6)
      @park_2 = @state_1.parks.create!(name: 'Collier-Seminole State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.4)
      @state_2 = State.create!(name: 'Maine', region: 'Northeast', military_discount: true, green_rank: 12)
      @park_3 = @state_2.parks.create!(name: 'Sebago Lake State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.7)
      @park_4 = @state_2.parks.create!(name: "Wolfe's Neck Woods State Park", camping_allowed: false, kayaking_available: false, park_rating: 4.5)
    end

    it 'displays on those which allow camping' do
      expect(Park.camping).to eq([@park_1, @park_2, @park_3])
    end

    it 'can reorganize the parks by name' do
      expect(Park.alphabatize).to eq([@park_2, @park_1, @park_3, @park_4])
    end

    it 'can filter the results by minimum park rating' do
      expect(Park.minimum_rating(4.6)).to eq([@park_1, @park_3])
    end
  end
end
