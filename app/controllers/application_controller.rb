class ApplicationController < ActionController::API
  def respond_with(object)
    if object.valid?
      render json: object
    else
      render json: { errors: object.errors.full_messages }, status: 422
    end
  end
end
