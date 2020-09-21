# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @pairings = Pairing.includes(client: :user, expert: :user).all.decorate
    @clients = Client.includes(:user).unpaired.decorate
    @experts = Expert.includes(:user).unpaired.decorate
    @json = render_to_string template: "api/home/index", formats: [:json]
  end
end
