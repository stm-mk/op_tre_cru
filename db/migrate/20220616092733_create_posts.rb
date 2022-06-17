class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.integer :friend_level, default: 0
      t.text :description
      t.references :user, index: { unique: true }, null: false, foreign_key: true

      t.timestamps
    end
  end
end
