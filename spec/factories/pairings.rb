# frozen_string_literal: true

FactoryBot.define do
  factory :pairing do
    client
    expert
  end
end
