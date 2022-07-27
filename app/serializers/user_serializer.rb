class UserSerializer < ActiveModel::Serializer
  attributes %i[id name email game_id level play_style avatar_url]
  has_one :post
  has_many :characters

  class CharacterSerializer < ActiveModel::Serializer
    attributes %i[id name element]
  end

  class PostSerializer < ActiveModel::Serializer
    attributes %i[id user_id title description friend_level]
  end
end
