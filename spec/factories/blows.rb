# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blow do
    distance "MyString"
    quality "MyString"
    preservation "MyString"
    behavior "MyString"
    group_size "MyString"
    comments "MyText"
    sighting nil
  end
end
