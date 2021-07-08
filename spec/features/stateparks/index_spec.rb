require 'rails_helper'

RSpec.describe 'StateParks' do
  describe 'visit state index' do

    it 'has the ability to read state content' do
      @state_1 = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 29)
      @park_1 = @state_1.parks.create!(name: 'Ginny Springs', camping_allowed: true, kayaking_available: true, park_rating: 4.6)
      @park_2 = @state_1.parks.create!(name: 'Collier-Seminole State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.4)

      visit "/states/#{@state_1.id}/parks"

      expect(page).to have_content(@park_1.name)
      expect(page).to have_content("Kayaking available? #{@park_1.kayaking_available}")
    end

    it 'has the ability to read state content' do
      @state_2 = State.create!(name: 'Maine', region: 'Northeast', military_discount: true, green_rank: 3)
      @park_3 = @state_2.parks.create!(name: 'Sebago Lake State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.7)
      @park_4 = @state_2.parks.create!(name: "Wolfe's Neck Woods State Park", camping_allowed: false, kayaking_available: false, park_rating: 4.5)

      visit "/states/#{@state_2.id}/parks"

      expect(page).to have_content(@park_3.name)
      expect(page).to have_content("Kayaking available? #{@park_3.kayaking_available}")
      expect(page).to have_content(@park_3.camping_allowed)
    end
  end
end
