class SightingCsvExporter
  def call
    CSV.generate do |csv|
      csv << attributes_column_names + belongs_column_names
      Sighting.joins(belongs_column_names_sym).all.each do |sighting|
        csv << sighting.attributes.values_at(*attributes_column_names) +
          belongs_attributes(sighting)
      end
    end
  end

  private

  def belongs_attributes(sighting)
    [sighting.region.name, sighting.vessel.name, sighting.sea_state.name,
     sighting.cloud_cover.name]
  end

  def attributes_column_names
    %w(id date time latitude longitude wind_speed wind_direction visibility precipitation comments staff start_time start_place end_time end_place comments2 created_at updated_at)
  end

  def belongs_column_names
    %w(region vessel sea_state cloud_cover)
  end

  def belongs_column_names_sym
    belongs_column_names.map(&:to_sym)
  end
end
