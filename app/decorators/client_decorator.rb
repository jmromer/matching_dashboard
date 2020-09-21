# frozen_string_literal: true

class ClientDecorator < ApplicationDecorator
  delegate_all
  delegate :name, to: :user
end
