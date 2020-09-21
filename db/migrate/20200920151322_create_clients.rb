# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.references :user, index: {:unique=>true}, null: false, foreign_key: true

      t.timestamps
    end
  end
end
