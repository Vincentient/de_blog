class WelcomeController < ApplicationController
  def index
    render json: { greeting: "Welcome!" }
  end
end
