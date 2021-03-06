class Sighting < ActiveRecord::Base
  belongs_to :region
  belongs_to :vessel
  belongs_to :sea_state
  belongs_to :cloud_cover
  belongs_to :mode
  belongs_to :species

  has_many :biopsies
  has_many :feces
  has_many :blows
  has_many :animal_sightings
  has_many :animals, through: :animal_sightings

  def self.search(search)
    if search
      where(search.delete_if { |k,v| v.empty? })
    else
      all
    end
  end

  def to_s
    id.to_s
  end
end
