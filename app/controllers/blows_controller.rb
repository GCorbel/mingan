class BlowsController < InheritedResources::Base
  include SmartListing::Scaffold

  belongs_to :sighting

  def index
    smart_listing_create :blows, parent.blows, partial: "list"
  end

  def new
    @blow = Blow.new(sighting: @sighting)
    respond_to do |format|
      format.html { index }
      format.js { super }
    end
  end

  private

  def columns
    [:distance, :quality, :preservation, :behavior, :group_size, :comments,
     :sighting_id]
  end
end
