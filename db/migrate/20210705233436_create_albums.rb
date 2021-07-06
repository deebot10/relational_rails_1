class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name
      t.integer :number_of_songs
      t.boolean :nominated

      t.timestamps
    end
  end
end
