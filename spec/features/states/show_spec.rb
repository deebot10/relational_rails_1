require 'rails_helper'

RSpec.describe 'State' do
  describe 'visit state index' do
    before(:each) do
      State.destroy_all
      @state_1 = State.create!(name: 'Florida', region: 'Southeast', military_discount: true)
      visit "/states/#{@state_1.id}"
    end

    it 'has the ability to read state content' do
      expect(page).to have_content(@state_1.name)
      expect(page).to have_content(@state_1.region)
      expect(page).to have_content('has a military discount')
      expect(page).to_not have_content('does not have a military discount')
    end
  end
end
