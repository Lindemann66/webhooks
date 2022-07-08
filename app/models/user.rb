# frozen_string_literal: true

# Top-level entity; helps provide an authentication.
class User < ApplicationRecord
  devise :database_authenticatable

  has_many :organizations, dependent: :destroy
  has_many :projects, through: :organizations

  validates :email, presence: true # , email: true, uniqueness: true
  validates :password, presence: true
end
