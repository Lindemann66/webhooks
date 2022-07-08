# frozen_string_literal: true

class Organization < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :tasks, through: :projects
  belongs_to :user

  validates :name, presence: true
end
