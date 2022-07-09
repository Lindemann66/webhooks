# frozen_string_literal: true

class User
  # Exposes user authorization logic.
  class AuthorizationService
    class Error < RuntimeError; end

    attr_reader :auth_header

    def initialize(options)
      @auth_header = options[:auth_header]
    end

    def run
      raise Error if auth_header.blank?

      auth_token = JsonWebToken.decode(auth_header.split.last)

      raise Error if auth_token.blank? || auth_token[:user_id].blank?

      User.find(auth_token[:user_id].to_i)
    rescue JWT::VerificationError, JWT::DecodeError
      raise Error
    end
  end
end
