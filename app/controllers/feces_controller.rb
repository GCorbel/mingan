class FecesController < InheritedResources::Base
  include SmartListing::Scaffold

  belongs_to :sighting

  def index
    smart_listing_create :feces, parent.feces, partial: "list"
  end

  def new
    @fece = Fece.new(sighting: @sighting)
    respond_to do |format|
      format.html { index }
      format.js { super }
    end
  end

  private

  def columns
    [:mass, :color, :consistency, :preservation]
  end
end
