class AnimalsController < InheritedResources::Base
  load_and_authorize_resource

  include SmartListing::Scaffold

  private

  def columns
    [:name, :biopsy_id, :fece_id, :blow_id]
  end
end
