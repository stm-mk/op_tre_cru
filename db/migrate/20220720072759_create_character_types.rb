class CreateCharacterTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :character_types do |t|
      t.references :character, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
    add_index :character_types, [:character_id, :type_id], unique: true
  end
end
