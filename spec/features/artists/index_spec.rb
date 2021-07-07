require 'rails_helper'

RSpec.describe 'Artist index page' do
  before(:each) do
    @artist_1 = Artist.create!(name: 'Childish Gambino', age: 37, genre: 'R&B/Rap', currently_touring: true)    
    @artist_2 = Artist.create!(name: 'Noname', age: 29, genre: 'Rap', currently_touring: true)
    @artist_3 = Artist.create!(name: 'Earl Sweatshirt', age: 27, genre: 'Rap', currently_touring: false)
    @artist_4 = Artist.create!(name: 'Frank Ocean', age: 33, genre: 'R&B', currently_touring: false)

    visit '/artists'
  end  

  # User Story 1  
  it 'can see each Artist record' do
    expect(page).to have_content(@artist_1.name)
    expect(page).to have_content(@artist_2.name)
    expect(page).to have_content(@artist_3.name)
    expect(page).to have_content(@artist_4.name)
  end    

  #User Story 6 
  it 'Shows the created_at for each record' do
    expect(page).to have_content(@artist_1.created_at)
    expect(page).to have_content(@artist_2.created_at)
    expect(page).to have_content(@artist_3.created_at)
    expect(page).to have_content(@artist_4.created_at)
  end
end 