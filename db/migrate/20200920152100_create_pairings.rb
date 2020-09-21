# frozen_string_literal: true

class CreatePairings < ActiveRecord::Migration[6.0]
  def change
    create_table :pairings do |t|
      t.references :client, null: false, foreign_key: true
      t.references :expert, null: false, foreign_key: true

      t.timestamps
      t.index %i[client_id expert_id], unique: true
    end
  end
end
