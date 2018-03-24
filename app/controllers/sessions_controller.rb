class SessionsController < ApplicationController
  skip_before_action :require_login

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      render json:
        {
          sucess: true,
          token: generate_auth_token(user.id),
          user: user.id
        }
    else
      render json:
      {
        success: false,
        error: "Invalid Email/Password"
      }, status: :bad_request
    end
  end

  private

  def generate_auth_token(user_id)
    payload = { user_id: user_id }
    JWT.encode(payload, SecureRandom.hex)
  end
end
