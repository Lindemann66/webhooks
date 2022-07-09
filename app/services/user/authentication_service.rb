# frozen_string_literal: true

class User
  # Exposes user authentication logic.
  class AuthenticationService
    class Error < RuntimeError; end

    attr_reader :user_params

    def initialize(options)
      @user_params = options[:user_params]
    end

    def run
      user = User.find_for_database_authentication(email: user_params[:email])

      if user.valid_password?(user_params[:password])
        return { auth_token: JsonWebToken.encode({ user_id: user.id }),
                 user: { id: user.id, email: user.email } }
      end

      raise Error
    end
  end
end
