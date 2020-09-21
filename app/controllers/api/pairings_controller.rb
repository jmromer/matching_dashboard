# frozen_string_literal: true

module Api
  class PairingsController < ApiController
    def create
      @pairing = Pairing.new(pairing_params).decorate

      if @pairing.save
        render :create, status: :created
      else
        render json: { errors: @pairing.errors.full_messages },
               status: :unprocessable_entity
      end
    end

    private

    def pairing_params
      params.require(:pairing).permit(:client_id, :expert_id)
    end
  end
end
