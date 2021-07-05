class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :age
      t.string :genre
      t.boolean :currently_touring

      t.timestamp
    end
  end
end
