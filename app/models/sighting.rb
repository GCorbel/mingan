class Sighting < ActiveRecord::Base
  belongs_to :region
  belongs_to :vessel
  belongs_to :sea_state
  belongs_to :cloud_cover

  def self.to_csv
    CSV.generate do |csv|
      csv << attributes_column_names + belongs_column_names
      joins(:region, :vessel, :sea_state, :cloud_cover).all.each do |sighting|
        csv << sighting.attributes.values_at(*attributes_column_names) + sighting.belongs_attributes
      end
    end
  end

  def self.search(search)
    where(search.delete_if { |k,v| v.empty? })
  end

  def belongs_attributes
    [region.name, vessel.name, sea_state.name, cloud_cover.name]
  end

  private

  def self.attributes_column_names
    %w(id date time latitude longitude wind_speed wind_direction visibility precipitation comments staff start_time start_place end_time end_place comments2 created_at updated_at)
  end

  def self.belongs_column_names
    %w(region vessel sea_state cloud_cover)
  end

end
