# frozen_string_literal: true

module ControllerTestHelpers
  def json_response
    JSON.parse(response.body, symbolize_names: true)
  end

  def sign_in_api_user(user = nil)
    user ||= FactoryBot.create(:user)
    @request.headers['Authorization'] = "Bearer #{JsonWebToken.encode({ user_id: user.id })}"
    user
  end
end

RSpec.configure do |config|
  config.include ControllerTestHelpers, type: :controller
  config.include ActiveSupport::Testing::TimeHelpers, type: :controller
end
