class Api::CharactersController < ApplicationController
  def index
    character = Character.order(created_at: :desc)
    render json: character
  end

  def create
    character = Character.build(character_params)
    if character.save
      render character
    else
      render json: character.errors, status: :bad_request
    end
  end

  private
  def character_params
    params.require(:character).permit(:name, :element)
  end
end
