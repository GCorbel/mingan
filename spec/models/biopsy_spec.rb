require 'rails_helper'

RSpec.describe Biopsy, :type => :model do
  it { is_expected.to belong_to(:sighting) }
end
