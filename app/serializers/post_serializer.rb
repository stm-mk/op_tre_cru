class PostSerializer < ActiveModel::Serializer
  attributes %i[id user_id title description friend_level]
  has_one :user

  class UserSerializer < ActiveModel::Serializer
    attributes %i[name avatar_url level play_style game_id]
  end
end
