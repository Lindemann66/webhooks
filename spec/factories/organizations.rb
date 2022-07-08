# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    user
    name { Faker::Company.name }
  end
end
