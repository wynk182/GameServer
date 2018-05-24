class AddTurnToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :turn, :integer, default: 0
    # add_column :games, :turn_token, :string
  end
end
