# frozen_string_literal: true

class Pairing < ApplicationRecord
  belongs_to :client
  belongs_to :expert

  validates :client, :expert, presence: true
  validates :client, uniqueness: { scoped_to: :expert }
end
