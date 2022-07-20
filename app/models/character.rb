class Character < ApplicationRecord
  has_many :user_characters, dependent: :destroy, foreign_key: 'character_id'
  has_many :users, through: :user_characters

  validates :name, uniqueness: true, presence: true
  validates :element, presence: true

  enum element: { chikara: 1, soku: 2, waza: 3, kokoro:4, chi: 5 }
end
