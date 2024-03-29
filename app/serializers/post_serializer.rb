class PostSerializer < ActiveModel::Serializer
  attributes %i[id user_id title description friend_level]
  has_one :user
  has_many :tags
  has_many :characters

  class UserSerializer < ActiveModel::Serializer
    attributes %i[name avatar_url level play_style game_id]
    has_many :characters

    class CharacterSerializer < ActiveModel::Serializer
      attributes %i[id name element]
    end
  end

  class TagSerializer < ActiveModel::Serializer
    attributes %i[id name]
  end

  class CharacterSerializer < ActiveModel::Serializer
    attributes %i[id name element]
  end
end
