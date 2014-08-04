require 'rails_helper'

RSpec.describe Sighting, :type => :model do

  it { is_expected.to belong_to(:region) }
  it { is_expected.to belong_to(:vessel) }
  it { is_expected.to belong_to(:sea_state) }
  it { is_expected.to belong_to(:cloud_cover) }
  it { is_expected.to belong_to(:mode) }

  describe "#search" do
    it "search models with the given parameters" do
      region1 = create(:region)
      vessel1 = create(:vessel)
      region2 = create(:region)
      vessel2 = create(:vessel)
      sighting1 = create(:sighting, region: region1, vessel: vessel1)
      create(:sighting, region: region2, vessel: vessel1)
      create(:sighting, region: region1, vessel: vessel2)
      search = { "region_id" => region1.id.to_s,
                 "vessel_id" => vessel1.id.to_s }
      expect(Sighting.search(search)).to eq [sighting1]
    end
  end
end
