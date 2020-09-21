# frozen_string_literal: true

json.id pairing.id

json.client pairing.client.decorate,
            partial: "api/clients/client",
            as: :client

json.expert pairing.expert.decorate,
            partial: "api/experts/expert",
            as: :expert
