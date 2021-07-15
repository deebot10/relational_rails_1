require 'rails_helper'

RSpec.describe State do
  before(:each) do
    @state_1 = State.create!(name: 'Florida', region: 'Southeast', military_discount: true)
    @state_2 = State.create!(name: 'Maine', region: 'Northeast', military_discount: true)
    @state_3 = State.create!(name: 'Washington', region: 'Northwest', military_discount: false)
    @park_1 = @state_1.parks.create!(name: 'Collier-Seminole State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.4)
    @park_2 = @state_1.parks.create!(name: 'Ginny Springs', camping_allowed: true, kayaking_available: true, park_rating: 4.6)
    @park_3 = @state_1.parks.create!(name: 'Biscayne Bay', camping_allowed: false, kayaking_available: true, park_rating: 4.8)
    @park_4 = @state_2.parks.create!(name: 'Sebago Lake State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.7)
    @park_5 = @state_2.parks.create!(name: "Wolfe's Neck Woods State Park", camping_allowed: false, kayaking_available: false, park_rating: 4.5)
  end

  describe 'relationships' do
    it {should have_many(:parks)}
  end

  describe 'class methods' do
    it 'can order the parent list by created_at' do
      expect(State.order_created).to eq([@state_3, @state_2, @state_1])
    end

    it 'can reorder the states by park quantity and includes parents without children' do
      expect(State.quant).to eq([@state_1, @state_2, @state_3])
    end
  end

  describe 'instance methods' do
    it 'can display the number of children on the parent list ' do
      expect(@state_1.parks_count).to eq(3)
    end
  end
end
