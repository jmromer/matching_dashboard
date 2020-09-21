# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" }
  end

  trait :client do
    sequence(:name) { |n| "Client #{n}" }
  end

  trait :expert do
    sequence(:name) { |n| "Expert #{n}" }
  end
end
