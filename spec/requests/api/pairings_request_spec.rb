# frozen_string_literal: true

require "rails_helper"

RSpec.describe "/pairings/", type: :request do
  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Pairing" do
        expert = create(:expert)
        client = create(:client)

        req = lambda do
          post api_pairings_url,
               params: { pairing: { expert_id: expert.id, client_id: client.id } }
        end

        expect { req.call }.to change(Pairing, :count).by(1)
        expect(response).to have_http_status(:created)
        expect(response_json).to have_keys(%i[pairing])
        expect(response_json[:pairing]).to have_keys(%i[id client expert])
        expect(response_json.dig(:pairing, :client)).to have_keys(%i[id name])
        expect(response_json.dig(:pairing, :expert)).to have_keys(%i[id name])
      end
    end

    context "with invalid parameters" do
      it "does not create a pairing, responds with error" do
        expert = create(:expert)

        req = lambda do
          post api_pairings_url,
               params: { pairing: { expert_id: expert.id, client_id: 99 } }
        end

        expect { req.call }.to change(Pairing, :count).by(0)
        expect(response.status).to eq(422)
        expect(response_json).to have_keys(%i[errors])
        expect(response_json[:errors]).to include("Client must exist")
      end
    end
  end
end
