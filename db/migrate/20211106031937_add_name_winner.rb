class AddNameWinner < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :playerx, :string
    add_column :games, :playero, :string
    add_column :games, :match_winner, :string, default: "Not Completed!"
  end
end
