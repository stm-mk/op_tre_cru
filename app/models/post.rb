class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :post_characters, dependent: :destroy
  has_many :characters, through: :post_characters

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 65_535 }

  def save_post_tags(savepost_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savepost_tags
    new_tags = savepost_tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_by(name: new_name)
      self.tags << post_tag
    end
  end

  def save_post_characters(savepost_characters)
    current_characters = self.characters.pluck(:name) unless self.characters.nil?
    old_characters = current_characters - savepost_characters
    new_characters = savepost_characters - current_characters

    old_characters.each do |old_name|
      self.characters.delete Character.find_by(name: old_name)
    end

    new_characters.each do |new_name|
      post_character = Character.find_by(name: new_name)
      self.characters << post_character
    end
  end
end
