# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
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