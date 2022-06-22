class AddUserToColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :play_style, :integer, default: 1
    add_column :users, :level, :integer, default: 0
    add_column :users, :game_id, :integer
  end
end
