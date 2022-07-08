# frozen_string_literal: true

# Base class for all controllers
class ApplicationController < ActionController::Base
  before_action :find_http_token, :find_auth_token, :authenticate_request!
  protect_from_forgery with: :null_session
  attr_reader :current_user

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found
    render json: { error: 'Not Found' }, status: :not_found
  end

  def unauthorized
    render json: { error: 'Unsuccessful auth' }, status: :unauthorized
  end

  def authenticate_request!
    return unauthorized unless @http_token && @auth_token && @auth_token[:user_id].to_i

    @current_user = User.find(@auth_token[:user_id])
  rescue JWT::VerificationError, JWT::DecodeError
    unauthorized
  end

  def find_http_token
    @http_token = (request.headers['Authorization'].split.last if request.headers['Authorization'].present?)
  end

  def find_auth_token
    @auth_token = JsonWebToken.decode(@http_token)
  end
end
