class CharacterSerializer < ActiveModel::Serializer
  attributes %i[id name element]
  has_many :types

  class TypeSerializer < ActiveModel::Serializer
    attributes %i[id name]
  end
end
