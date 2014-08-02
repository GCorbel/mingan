class RegionsController < InheritedResources::Base
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  respond_to :html, :js

  def index
    smart_listing_create :regions, Region.all
  end

  def new
    @region = Region.new
    respond_to do |format|
      format.html
      format.js { render 'new' }
    end
  end

  def update
    resource.update_attributes(permitted_params)
  end

  def create
    @region = Region.create(permitted_params)
  end

  private

  def permitted_params
    params.require(:region).permit(:name)
  end
end
