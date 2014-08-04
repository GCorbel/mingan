class AnimalSighting < ActiveRecord::Base
  belongs_to :animal
  belongs_to :sighting
end
