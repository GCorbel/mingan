class AnimalsController < InheritedResources::Base
  load_and_authorize_resource

  include SmartListing::Scaffold

  def index
    animals = Animal.includes(:species, :vessel).all
    smart_listing_create :animals, animals, partial: "animals/list"
  end

  private

  def columns
    [:number, :field_id, :pics_id, :position_in_group, :biopsy_id,
     :cow_calf, :first_sight, :time, :species_id, :vessel_id]
  end
end
