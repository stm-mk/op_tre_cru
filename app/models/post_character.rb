class PostCharacter < ApplicationRecord
  belongs_to :post
  belongs_to :character
end
