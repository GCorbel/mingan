class Sighting < ActiveRecord::Base
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |sighting|
        csv << sighting.attributes.values_at(*column_names)
      end
    end
  end
end
