class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  before_action :require_login

  def require_login
    unless current_user
      render json: { error: "Please sign in!" }, status: :unathorized
    end
  end

  def current_user
    if request.headers['Authorization']
      decoded_auth_token = JWT.decode(request.headers['Authorization'].split(' ').last, nil, false)
      User.find_by(id: decoded_auth_token[0]["user_id"])
    end
  end

  helper_method :current_user
end
