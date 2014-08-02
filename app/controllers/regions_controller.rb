class RegionsController < InheritedResources::Base
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def index
    smart_listing_create :regions, Region.all, partial: "regions/list"
  end
end
