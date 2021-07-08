require 'rails_helper'

RSpec.describe 'State' do
  describe 'visit state index' do
    before(:each) do
      @state_1 = State.create!(name: 'Florida', region: 'Southeast', military_discount: true)
      @state_2 = State.create!(name: 'Maine', region: 'Northeast', military_discount: true)
      @state_3 = State.create!(name: 'Washington', region: 'Northwest', military_discount: false)
      visit '/states'
    end

    it 'has the ability to read state content' do
      expect(page).to have_content(@state_1.name)
      expect(page).to have_content(@state_2.region)
      expect(page).to have_content(@state_3.military_discount)
    end

    it 'orders the states by the most recently created' do
      expect(page).to have_content(@state_1.name)
      this = 'Washington'
      that = 'Maine'
      other = 'Florida'

      expect(this).to appear_before(that)
      expect(that).to appear_before(other)

    end


  end
end
