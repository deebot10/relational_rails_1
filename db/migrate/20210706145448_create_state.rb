class CreateState < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name
      t.string :region
      t.boolean :military_discount
      t.timestamps
    end
  end
end
