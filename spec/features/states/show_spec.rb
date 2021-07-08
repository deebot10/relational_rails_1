require 'rails_helper'

RSpec.describe 'State' do
  describe 'visit state index' do
    before(:each) do
      State.destroy_all
      @state_1 = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 29)
      @park_1 = @state_1.parks.create!(name: 'Ginny Springs', camping_allowed: true, kayaking_available: true, park_rating: 4.6)
      @park_2 = @state_1.parks.create!(name: 'Collier-Seminole State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.4)
      visit "/states/#{@state_1.id}"
    end

    it 'has the ability to read state content' do
      expect(page).to have_content(@state_1.name)
      expect(page).to have_content(@state_1.region)
      expect(page).to have_content(@state_1.green_rank)
      expect(page).to have_content('has a military discount')
      expect(page).to_not have_content('does not have a military discount')
    end

    it 'shows the number of parks associated with the state' do
      expect(page).to have_content("Number of Parks in this State: #{@state_1.parks.count}")
    end
  end
end
