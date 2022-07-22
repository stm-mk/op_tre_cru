class User < ApplicationRecord
  include JwtToken
  authenticates_with_sorcery!

  has_one :post, dependent: :destroy
  has_one_attached :avatar
  has_many :user_characters, dependent: :destroy
  has_many :characters, through: :user_characters

  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true

  enum play_style: { enjoy: 1, gachi: 2 }

  def avatar_url
    avatar.attached? ? Rails.application.routes.url_helpers.rails_blob_path(avatar, only_path: true) : nil
  end

  def save_user(saveuser_characters)
    current_characters = self.characters.pluck(:name) unless self.characters.nil?
    old_characters = current_characters - saveuser_characters
    new_characters = saveuser_characters - current_characters

    old_characters.each do |old_name|
      self.characters.delete Character.find_by(name: old_name)
    end

    new_characters.each do |new_name|
      user_character = Character.find_by(name: new_name)
      self.characters << user_character
    end
  end
end
