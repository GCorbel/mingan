require 'rails_helper'

RSpec.describe Sighting, :type => :model do

  it { is_expected.to belong_to(:region) }
  it { is_expected.to belong_to(:vessel) }
  it { is_expected.to belong_to(:sea_state) }
  it { is_expected.to belong_to(:cloud_cover) }

  describe "#to_csv" do
    it "give the csv format of the sightings" do
      new_time = Time.local(2008, 9, 1, 12, 0, 0)
      region1 = create(:region, name: "Region1")
      vessel1 = create(:vessel, name: "Vessel1")
      region2 = create(:region, name: "Region2")
      vessel2 = create(:vessel, name: "Vessel2")
      Timecop.freeze(new_time) do
        sighting1 = create(:sighting, date: "01.01.2011", region: region1,
                           vessel: vessel1)
        sighting2 = create(:sighting, date: "01.01.2012", region: region2,
                           vessel: vessel2)
        csv = ""\
          "id,date,time,latitude,longitude,wind_speed,wind_direction,visibility,precipitation,comments,staff,start_time,start_place,end_time,end_place,comments2,created_at,updated_at,region,vessel,sea_state,cloud_cover\n"\
          "#{sighting1.id},2011-01-01,2000-01-01 16:42:11 UTC,MyString,MyString,MyString,MyString,MyString,MyString,MyText,MyString,2000-01-01 16:42:11 UTC,MyString,2000-01-01 16:42:11 UTC,MyString,MyText,2008-09-01 16:00:00 UTC,2008-09-01 16:00:00 UTC,Region1,Vessel1,MyString,MyString\n"\
          "#{sighting2.id},2012-01-01,2000-01-01 16:42:11 UTC,MyString,MyString,MyString,MyString,MyString,MyString,MyText,MyString,2000-01-01 16:42:11 UTC,MyString,2000-01-01 16:42:11 UTC,MyString,MyText,2008-09-01 16:00:00 UTC,2008-09-01 16:00:00 UTC,Region2,Vessel2,MyString,MyString\n"
        expect(Sighting.to_csv).to eq csv
      end
    end
  end

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
