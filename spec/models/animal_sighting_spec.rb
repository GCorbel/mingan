require 'rails_helper'

RSpec.describe AnimalSighting, :type => :model do
  it { is_expected.to belong_to(:animal) }
  it { is_expected.to belong_to(:sighting) }
end
