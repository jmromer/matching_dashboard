# frozen_string_literal: true

class PairingDecorator < ApplicationDecorator
  delegate_all

  def label
    "#{client_name} (client) and #{expert_name} (expert)"
  end

  def client_name
    client.user.name
  end

  def expert_name
    expert.user.name
  end
end
