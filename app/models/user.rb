# frozen_string_literal: true

# Provides the basic authentication on the 'model level'; probably will be the top-level model in the future.
class User < ApplicationRecord
  devise :database_authenticatable

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
