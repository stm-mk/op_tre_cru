class Api::TypesController < ApplicationController
  def index
    types = Type.order(created_at: :desc)
    render json: types
  end

  def create
    type = Type.build(type_params)
    if type.save
      render type
    else
      render json: type.errors, status: :bad_request
    end
  end

  private
  def type_params
    params.require(:type).permit(:name)
  end
end
