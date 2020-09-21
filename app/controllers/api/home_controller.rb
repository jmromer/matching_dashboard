# frozen_string_literal: true

module Api
  class HomeController < ApiController
    def index
      @pairings = Pairing.includes(client: :user, expert: :user).all.decorate
      @clients = Client.includes(:user).unpaired.decorate
      @experts = Expert.includes(:user).unpaired.decorate
    end
  end
end
