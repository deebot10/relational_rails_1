class AddStateToParks < ActiveRecord::Migration[5.2]
  def change
    add_reference :parks, :state, foreign_key: true
  end
end
