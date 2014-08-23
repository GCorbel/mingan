class BiopsiesController < InheritedResources::Base
  load_and_authorize_resource

  include SmartListing::Scaffold

  belongs_to :sighting

  def index
    smart_listing_create :biopsies, parent.biopsies, partial: "list"
  end

  def new
    @biopsy = Biopsy.new(sighting: @sighting)
    respond_to do |format|
      format.html { index }
      format.js { super }
    end
  end

  private

  def columns
    [:tissue, :preservation, :purpose, :reaction, :comments, :sex, :sighting_id]
  end
end
