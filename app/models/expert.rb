# frozen_string_literal: true

class Expert < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  scope :unpaired, -> { where.not(id: Pairing.select(:expert_id)) }
end
