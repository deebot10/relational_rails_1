class AddGreenRankToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :green_rank, :integer
  end
end
