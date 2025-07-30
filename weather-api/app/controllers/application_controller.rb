class ApplicationController < ActionController::API
  def authenticate_user
    # Allowing all requests for this example app
    true
  end
end
