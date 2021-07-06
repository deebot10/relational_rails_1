require 'rails_helper'

RSpec.describe 'Artist Show Page' do
  before(:each) do
    @artist = Artist.create!(name: 'Childish Gambino', age: 37, genre: 'R&B/Rap', currently_touring: true)     
    @dee = Artist.create!(name: 'dee', age: 25, genre: 'R&B/Rap', currently_touring: true)     

    @album_1 = @artist.albums.create!(name: 'Awaken My Love', number_of_songs: 11, nominated: true)
    @album_2 = @artist.albums.create!(name: 'Because the Internet', number_of_songs: 19, nominated: false)
    @album_3 = @artist.albums.create!(name: 'Camp', number_of_songs: 13, nominated: false)

    visit "/artists/#{@artist.id}" 
  end      
  
  # User Story 2
  it 'shows the Artist including attributes' do
    expect(page).to have_content(@artist.name)
    expect(page).to have_content(@artist.age)
    expect(page).to have_content(@artist.genre)
    expect(page).to have_content(@artist.currently_touring)

    expect(page).to_not have_content(@dee.name)
    expect(page).to_not have_content(@dee.age)
    expect(page).to_not have_content(@dee.genre)
    expect(page).to_not have_content(@dee.currently_touring)
  end
end