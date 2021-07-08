require 'rails_helper'

RSpec.describe 'Album Show' do
  before(:each) do
    @artist_1 = Artist.create!(name: 'Childish Gambino', age: 37, genre: 'R&B/Rap', currently_touring: true)
    @album_1 = @artist_1.albums.create!(name: 'Awaken My Love', number_of_songs: 11, nominated: true)

    visit "/albums/#{@album_1.id}"
  end

    # User Story 4
  it 'visit the album show page' do
    expect(page).to have_content(@album_1.name)
    expect(page).to have_content(@album_1.number_of_songs)
    expect(page).to have_content(@album_1.nominated)
  end

  it 'has a link to the list of albums' do
    expect(page).to have_link('Albums')
    click_link 'Albums'
    expect(current_path).to eq('/albums')
  end

  it 'has a link to the list of artists' do
    expect(page).to have_link('Artists')
    click_link 'Artists'
    expect(current_path).to eq('/artists')
  end
end
