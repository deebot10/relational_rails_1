require 'rails_helper'

RSpec.describe 'Hits Index' do
  before(:each) do
    @artist = Artist.create!(name: 'Childish Gambino', age: 37, genre: 'R&B/Rap', currently_touring: true)

    @album_1 = @artist.albums.create!(name: 'Because the Internet', number_of_songs: 19, nominated: false)
    @album_2 = @artist.albums.create!(name: 'Awaken My Love', number_of_songs: 11, nominated: true)
    @album_3 = @artist.albums.create!(name: 'Camp', number_of_songs: 13, nominated: false)

    visit "/artists/#{@artist.id}/albums"
  end

    #User Story 5
  it 'shows every album by an artist' do
    expect(page).to have_content(@artist.name)

    expect(page).to have_content(@album_1.name)
    expect(page).to have_content(@album_1.number_of_songs)
    expect(page).to have_content(@album_1.nominated)

    expect(page).to have_content(@album_2.name)
    expect(page).to have_content(@album_2.number_of_songs)
    expect(page).to have_content(@album_2.nominated)

    expect(page).to have_content(@album_3.name)
    expect(page).to have_content(@album_3.number_of_songs)
    expect(page).to have_content(@album_3.nominated)
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

  # User Story 13
  it 'can Create a new album for a Artist' do

    click_button 'Add Album'

    expect(current_path).to eq("/artists/#{@artist.id}/albums/new")

    fill_in 'Name', with: '3.15.20'
    fill_in 'Number of songs', with: 12 
    fill_in 'Nominated', with: 'false'

    click_button 'Add Album'

    expect(current_path).to eq("/artists/#{@artist.id}/albums")

    expect(page).to have_content('3.15.20')
  end
  
  #User Story 16 
  it 'can alphabatize the index of songs' do

    click_link 'Sort by Title'
    
    expect(@album_2.name).to appear_before(@album_1.name) 
    expect(@album_1.name).to appear_before(@album_3.name) 
    expect(@album_3.name).to_not appear_before(@album_2.name) 
  end
  
  #User Story 18
  it 'has a link to update album' do

    click_button "Edit #{@album_1.name}"

    expect(current_path).to eq("/albums/#{@album_1.id}/edit")
  end
end
