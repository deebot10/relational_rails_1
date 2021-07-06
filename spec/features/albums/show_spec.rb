require 'rails_helper'

RSpec.describe 'Album Show' do
  before(:each) do
    @artist_1 = Artist.create!(name: 'Childish Gambino', age: 37, genre: 'R&B/Rap', currently_touring: true)    
    @album_1 = @artist_1.albums.create!(name: 'Awaken My Love', number_of_songs: 11, nominated: true)    

    visit "/albums/#{@album_1.id}" 
  end     
end