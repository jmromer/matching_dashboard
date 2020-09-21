# frozen_string_literal: true

FactoryBot.define do
  factory :expert do
    user { create(:user, :expert) }
  end
end
