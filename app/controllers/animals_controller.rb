class AnimalsController < InheritedResources::Base
  include SmartListing::Scaffold

  private

  def columns
    [:name, :biopsy_id, :fece_id, :blow_id]
  end
end
