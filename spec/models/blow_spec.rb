require 'rails_helper'

RSpec.describe Blow, :type => :model do
  it { is_expected.to belong_to(:sighting) }
end
