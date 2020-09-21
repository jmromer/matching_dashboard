# frozen_string_literal: true

require "rails_helper"

RSpec.describe Pairing, type: :model do
  it { should validate_presence_of(:client) }
  it { should validate_presence_of(:expert) }
  it { should belong_to(:expert) }
  it { should belong_to(:client) }
end
