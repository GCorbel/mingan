require 'rails_helper'

RSpec.describe Animal, :type => :model do
  it { is_expected.to belong_to(:biopsy) }
  it { is_expected.to belong_to(:fece) }
  it { is_expected.to belong_to(:blow) }
  it { is_expected.to belong_to(:species) }
  it { is_expected.to belong_to(:vessel) }
end
