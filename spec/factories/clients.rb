# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    user { create(:user, :client)  }
  end
end
