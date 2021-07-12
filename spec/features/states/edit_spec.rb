require 'rails_helper'

RSpec.describe 'State edit' do
  it 'links to the edit page' do
    state_1 = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 29)
    visit '/states'

    click_button("Edit #{state_1.name}")
    expect(current_path).to eq("/states/#{state_1.id}/edit")
  end

  it 'can edit the state' do
    state_1 = State.create!(name: 'Florid', region: 'Southeast', military_discount: true, green_rank: 29)

    visit '/states'
    expect(page).to have_content('Florid')
    click_button 'Edit Florid'

    visit "/states/#{state_1.id}/edit"
    fill_in 'Name', with: 'Florida'
    fill_in 'Region of Country', with: 'Southeast'
    check(:military_discount)
    fill_in 'Green rank', with: '29'
    click_button "Update #{state_1.name}"

    expect(current_path).to eq("/states/#{state_1.id}")
    expect(page).to have_content('Florida')
  end

end
