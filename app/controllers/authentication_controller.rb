# frozen_string_literal: true

# Exposes authentication for user.
class AuthenticationController < ApplicationController
  skip_before_action :authorize_request!

  def authenticate_user
    render json: User::AuthenticationService.new(user_params: user_params).run
  rescue User::AuthenticationService::Error
    unauthorized
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
