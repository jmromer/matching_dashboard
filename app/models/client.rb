# frozen_string_literal: true

class Client < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  scope :unpaired, -> { where.not(id: Pairing.select(:client_id)) }
end
