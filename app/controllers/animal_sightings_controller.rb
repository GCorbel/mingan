class AnimalSightingsController < InheritedResources::Base
  include SmartListing::Scaffold

  belongs_to :sighting

  def index
    smart_listing_create :animal_sightings, parent.animal_sightings, partial: "list"
  end

  def new
    @animal_sighting = AnimalSighting.new(sighting: @sighting)
    respond_to do |format|
      format.html { index }
      format.js { super }
    end
  end

  private

  def columns
    [:sighting_id, :animal_id]
  end
end
