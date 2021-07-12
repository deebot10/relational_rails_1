require 'rails_helper'

RSpec.describe 'State creation' do
  it 'links to the new page from the state index' do
    visit '/states'

    click_link('New State')
    expect(current_path).to eq('/states/new')
  end

  it 'can create a new state' do
    visit '/states/new'

    fill_in('name', with: 'Georgia')
    check(:military_discount)
    fill_in('region', with: 'Southeast')
    fill_in('green_rank', with: '29')
    click_button("Create State")

    # new_state_id = State.last.id
    expect(page).to have_content('Georgia')
    expect(current_path).to eq('/states')
  end
end
