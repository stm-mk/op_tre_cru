class CreatePostCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :post_characters do |t|
      t.references :post, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
    add_index :post_characters, [:post_id, :character_id], unique: true
  end
end
