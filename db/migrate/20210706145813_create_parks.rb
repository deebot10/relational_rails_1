class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.boolean :camping_allowed
      t.boolean :kayaking_available
      t.float :park_rating
      t.timestamps
    end
  end
end
