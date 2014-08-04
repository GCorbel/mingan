# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :biopsy do
    tissue "MyString"
    preservation "MyString"
    purpose "MyString"
    reaction "MyString"
    comments "MyText"
    sex "MyString"
    sighting nil
  end
end
