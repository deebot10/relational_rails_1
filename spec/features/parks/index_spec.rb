require 'rails_helper'

RSpec.describe 'Park' do
  describe 'visit park index' do
    before(:each) do
      Park.destroy_all
      State.destroy_all
      @state_1 = State.create!(name: 'Florida', region: 'Southeast', military_discount: true)
      @state_2 = State.create!(name: 'Maine', region: 'Northeast', military_discount: true)
      # @park_1 = @state_1.parks.create!(name: 'Ginny Springs', camping_allowed: true, kayaking_available: true, park_rating: 4.6)
      @park_1 = Park.create!(state_id: @state_1.id, name: 'Ginny Springs', camping_allowed: true, kayaking_available: true, park_rating: 4.6)
      #either way of the two above works
      @park_2 = Park.create!(state_id: @state_2.id, name: 'Sebago Lake State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.7)
      @park_3 = Park.create!(state_id: @state_1.id, name: 'Collier-Seminole State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.4)
      @park_4 = Park.create!(state_id: @state_2.id, name: "Wolfe's Neck Woods State Park", camping_allowed: false, kayaking_available: false, park_rating: 4.5)
      visit '/parks'
    end

    it 'has the ability to read park content' do
      expect(page).to have_content(@park_1.name)
      expect(page).to have_content(@park_1.camping_allowed)
      expect(page).to have_content(@park_1.kayaking_available)
      expect(page).to have_content(@park_1.park_rating)
      expect(page).to have_content(@park_1.state_id)

    end

    it 'has a link to the list of states' do
      expect(page).to have_link('States')
      click_link 'States'
      expect(current_path).to eq('/states')
    end

    it 'has a link to the list of parks' do
      expect(page).to have_link('Parks')
      click_link 'Park'
      expect(current_path).to eq('/parks')
    end
  end
end
