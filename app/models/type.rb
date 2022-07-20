class Type < ApplicationRecord
  has_many :character_types, dependent: :destroy, foreign_key: 'type_id'
  has_many :characters, through: :character_types

  validates :name, uniqueness: true, presence: true
end
