require 'rails_helper'

RSpec.describe 'Artist Show Page' do
  before(:each) do
    @artist = Artist.create!(name: 'Childish Gambino', age: 37, genre: 'R&B/Rap', currently_touring: true)
    @dee = Artist.create!(name: 'dee', age: 25, genre: 'New Wave', currently_touring: false)

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

  # User Story 7
  it 'shows the number of artist albums' do
    expect(page).to have_content("Number of Albums: #{@artist.album_count}")
  end
  
  # User Story 8
  it 'has a link to the list of artists' do
    expect(page).to have_link('Artists')

    click_link 'Artists'

    expect(current_path).to eq('/artists')
  end

  # User Story 9 
  it 'has a link to the list of albums' do
    expect(page).to have_link('Albums')

    click_link 'Albums'

    expect(current_path).to eq('/albums')
  end
  
  # User Story 10
  it 'has a link to hits view' do
    expect(page).to have_link(@artist.name)

    click_link "#{@artist.name}"

    expect(current_path).to eq("/artists/#{@artist.id}/albums")
  end 

  # User Story 12
  it 'can update and artist and the attributes' do
      
    click_button 'Edit Artist' 

    expect(current_path).to eq("/artists/#{@artist.id}/edit")

    fill_in 'Name', with: 'dee'
    fill_in 'Age', with: 25
    fill_in 'Genre', with: 'Country'
    fill_in 'Currently touring', with: 'true'
    click_button 'Edit Artist'
     
    expect(page).to have_content('dee')
    expect(page).to have_content(25)
  end
  
  #User Story 19
  it 'can delete an artsit' do
    
    click_button 'Delete Artist'

    expect(current_path).to eq('/artists')

    expect(page).to_not have_content('Childish Gambino')
  end
end
