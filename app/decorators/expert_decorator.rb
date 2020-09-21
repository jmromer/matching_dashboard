# frozen_string_literal: true

class ExpertDecorator < ApplicationDecorator
  delegate_all
  delegate :name, to: :user
end
