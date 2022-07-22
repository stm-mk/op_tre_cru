class UserSerializer < ActiveModel::Serializer
  attributes %i[id name email game_id level play_style avatar_url]
  has_many :characters

  class CharacterSerializer < ActiveModel::Serializer
    attributes %i[id name element]
  end
end
