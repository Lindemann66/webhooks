# frozen_string_literal: true

# Exposes authentication for user.
class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request!

  def authenticate_user
    user = User.find_for_database_authentication(email: user_params[:email])
    if user.valid_password?(user_params[:password])
      render json: { auth_token: JsonWebToken.encode({ user_id: user.id }),
                     user: { id: user.id, email: user.email } }
    else
      unauthorized
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
