# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
State.destroy_all
# Examples:
Park.destroy_all
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Artist.destroy_all
Album.destroy_all

@artist_1 = Artist.create!(name: 'Childish Gambino', age: 37, genre: 'R&B/Rap', currently_touring: true)

@album_1 = @artist_1.albums.create!(name: 'Awaken My Love', number_of_songs: 11, nominated: true)
@album_2 = @artist_1.albums.create!(name: 'Because the Internet', number_of_songs: 19, nominated: false)
@album_3 = @artist_1.albums.create!(name: 'Camp', number_of_songs: 13, nominated: false)

@artist_2 = Artist.create!(name: 'Noname', age: 29, genre: 'Rap', currently_touring: true)

@album_4 = @artist_2.albums.create!(name: 'Telefone', number_of_songs: 10, nominated: false)
@album_5 = @artist_2.albums.create!(name: 'Room 25', number_of_songs: 11, nominated: false)

@artist_3 = Artist.create!(name: 'Earl Sweatshirt', age: 27, genre: 'Rap', currently_touring: false)

@album_6 = @artist_3.albums.create!(name: 'Some Rap Songs', number_of_songs: 15, nominated: false)















@state_1 = State.create!(name: 'Florida', region: 'Southeast', military_discount: true, green_rank: 42)
@park_1 = @state_1.parks.create!(name: 'Ginny Springs', camping_allowed: true, kayaking_available: true, park_rating: 4.6)
@park_2 = @state_1.parks.create!(name: 'Collier-Seminole State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.4)

@state_2 = State.create!(name: 'Maine', region: 'Northeast', military_discount: true, green_rank: 12)
@park_3 = @state_2.parks.create!(name: 'Sebago Lake State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.7)
@park_4 = @state_2.parks.create!(name: "Wolfe's Neck Woods State Park", camping_allowed: false, kayaking_available: false, park_rating: 4.5)

@state_3 = State.create!(name: 'Hawaii', region: 'West', military_discount: false, green_rank: 8)
@park_5 = @state_3.parks.create!(name: 'Makena', camping_allowed: false, kayaking_available: true, park_rating: 4.8)
@park_6 = @state_3.parks.create!(name: "Wai'anapanapa State Park", camping_allowed: false, kayaking_available: false, park_rating: 4.7)

@state_4 = State.create!(name: 'California', region: 'West', military_discount: true, green_rank: 5)
@park_7 = @state_4.parks.create!(name: 'Folsom Lake State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.6)
@park_8 = @state_4.parks.create!(name: "McArthur-Burney Falls State Park", camping_allowed: true, kayaking_available: true, park_rating: 4.8)

@state_5 = State.create!(name: 'Mississippi', region: 'Southeast', military_discount: false, green_rank: 48)
@park_9 = @state_5.parks.create!(name: 'Shepard State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.3)
@park_10 = @state_5.parks.create!(name: "Clarkco State Park", camping_allowed: true, kayaking_available: true, park_rating: 4.6)
@park_11 = @state_6.parks.create!(name: "Franklin State Park", camping_allowed: false, kayaking_available: false, park_rating: 4.4)

@state_6 = State.create!(name: 'Vermont', region: 'Northeast', military_discount: false, green_rank: 1)
@park_12 = @state_6.parks.create!(name: 'Grand Isle State Park', camping_allowed: true, kayaking_available: true, park_rating: 4.8)
@park_13 = @state_6.parks.create!(name: "Underhill State Park", camping_allowed: true, kayaking_available: false, park_rating: 4.9)
@park_14 = @state_6.parks.create!(name: "Underhill State Park", camping_allowed: true, kayaking_available: false, park_rating: 4.9)
@park_15 = @state_6.parks.create!(name: "Half Moon State Park", camping_allowed: true, kayaking_available: true, park_rating: 4.7)
