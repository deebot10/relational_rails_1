require 'rails_helper'

RSpec.describe State do
  describe 'relationships' do
    it {should have_many(:parks)}
  end

  describe 'class methods' do
    before(:each) do
      @state_1 = State.create!(name: 'Florida', region: 'Southeast', military_discount: true)
      @state_2 = State.create!(name: 'Maine', region: 'Northeast', military_discount: true)
      @state_3 = State.create!(name: 'Washington', region: 'Northwest', military_discount: false)
    end

    it 'orders the parent list by created_at' do
      expect(State.order_created).to eq([@state_3, @state_2, @state_1])
    end

    it 'can display the number of children on the parent list ' do
      expect(@state_1.parks_count).to eq(0)
    end
  end
end
