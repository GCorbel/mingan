require 'rails_helper'

RSpec.describe Sighting, :type => :model do
  describe "#to_csv" do
    it "give the csv format of the sightings" do
      new_time = Time.local(2008, 9, 1, 12, 0, 0)
      Timecop.freeze(new_time) do
        create(:sighting, date: "01.01.2011", region: "Region1", vessel: "Vessel1")
        create(:sighting, date: "01.01.2012", region: "Region2", vessel: "Vessel2")
        csv = ""\
          "id,date,region,vessel,time,latitude,longitude,sea_state,cloud_cover,wind_speed,wind_direction,visibility,precipitation,comments,staff,start_time,start_place,end_time,end_place,comments2,created_at,updated_at\n"\
          "1,2011-01-01,Region1,Vessel1,2000-01-01 16:42:11 UTC,MyString,MyString,MyString,MyString,MyString,MyString,MyString,MyString,MyText,MyString,2000-01-01 16:42:11 UTC,MyString,2000-01-01 16:42:11 UTC,MyString,MyText,2008-09-01 16:00:00 UTC,2008-09-01 16:00:00 UTC\n"\
          "2,2012-01-01,Region2,Vessel2,2000-01-01 16:42:11 UTC,MyString,MyString,MyString,MyString,MyString,MyString,MyString,MyString,MyText,MyString,2000-01-01 16:42:11 UTC,MyString,2000-01-01 16:42:11 UTC,MyString,MyText,2008-09-01 16:00:00 UTC,2008-09-01 16:00:00 UTC\n"
        expect(Sighting.to_csv).to eq csv
      end
    end
  end
end
