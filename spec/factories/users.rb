# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "#{Faker::Lorem.word}@email.com" }
    password { Faker::Internet.password(min_length: 5) }
  end
end
