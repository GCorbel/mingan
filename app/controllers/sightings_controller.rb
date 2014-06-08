class SightingsController < InheritedResources::Base
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  respond_to :html, :js

  def index
    smart_listing_create :sightings, Sighting.all, partial: "sightings/list"
  end

  def new
    @sighting = Sighting.new
    respond_to do |format|
      format.html
      format.js { render 'new' }
    end
  end

  def create
    @sighting = Sighting.create(permitted_params)
  end

  def update
    resource.update_attributes(permitted_params)
  end

  private


  def permitted_params
    params.require(:sighting).permit(:date, :time, :region, :vessel,
                                     :longitude, :latitude, :sea_state,
                                     :cloud_cover, :wind_speed,
                                     :wind_direction, :comments, :staff,
                                     :start_time, :start_place, :end_time,
                                     :end_place, :comments2)
  end

  def presenter
    @presenter ||= SightingsPresenter.new
  end
  helper_method :presenter
end