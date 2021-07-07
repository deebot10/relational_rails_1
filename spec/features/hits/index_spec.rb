require 'rails_helper'

RSpec.describe 'Hits Index' do
  before(:each) do
    @artist = Artist.create!(name: 'Childish Gambino', age: 37, genre: 'R&B/Rap', currently_touring: true)     

    @album_1 = @artist.albums.create!(name: 'Awaken My Love', number_of_songs: 11, nominated: true)
    @album_2 = @artist.albums.create!(name: 'Because the Internet', number_of_songs: 19, nominated: false)
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
end