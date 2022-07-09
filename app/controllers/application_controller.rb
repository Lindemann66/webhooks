# frozen_string_literal: true

# Base class for all controllers
class ApplicationController < ActionController::Base
  before_action :authorize_request!
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

  def authorize_request!
    @current_user = User::AuthorizationService.new(auth_header: request.headers['Authorization']).run
  rescue User::AuthorizationService::Error
    unauthorized
  end
end
