class SightingsController < InheritedResources::Base
  load_and_authorize_resource
  include SmartListing::Scaffold

  respond_to :html, :js, :xml, :csv

  def index
    @search = Sighting.new
    respond_to do |format|
      format.html { smart_listing_create :sightings, Sighting.all,
                    partial: "sightings/list" }
      format.js { smart_listing_create :sightings,
                    Sighting.search(params["search"]),
                    partial: "sightings/list" }
      format.csv { send_data SightingCsvExporter.new.call }
      format.xml { render xml: Sighting.all.to_xml }
    end
  end

  def new
    @sighting = Sighting.new(session[:new_sighting_params])
    super
  end

  def create
    session[:new_sighting_params] = params[:sighting]
    super
  end

  private

  def columns
    [:date, :time, :region_id, :vessel_id, :longitude, :latitude,
     :sea_state_id, :cloud_cover_id, :wind_speed, :wind_direction, :comments,
     :staff, :start_time, :start_place, :end_time, :end_place, :comments2,
     :species_id, :mode_id]
  end

  def presenter
    @presenter ||= SightingsPresenter.new
  end
  helper_method :presenter
end
