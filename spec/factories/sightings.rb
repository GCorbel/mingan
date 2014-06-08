# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sighting do
    date "2014-06-05"
    region "MyString"
    vessel "MyString"
    time "2014-06-05 16:42:11"
    latitude "MyString"
    longitude "MyString"
    sea_state "MyString"
    cloud_cover "MyString"
    wind_speed "MyString"
    wind_direction "MyString"
    visibility "MyString"
    precipitation "MyString"
    comments "MyText"
    staff "MyString"
    start_time "2014-06-05 16:42:11"
    start_place "MyString"
    end_time "2014-06-05 16:42:11"
    end_place "MyString"
    comments2 "MyText"
  end
end
