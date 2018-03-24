class UsersController < ApplicationController
  def index
    users = User.all
    render json: { user: users }
  end
end
