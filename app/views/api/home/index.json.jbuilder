# frozen_string_literal: true

json.pairings @pairings, partial: "api/pairings/pairing", as: :pairing
json.clients @clients, partial: "api/clients/client", as: :client
json.experts @experts, partial: "api/experts/expert", as: :expert
