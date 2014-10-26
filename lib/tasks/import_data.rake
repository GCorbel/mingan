class FmpSighting
  def self.attr_list
    [:boat, :date, :time, :latdegre, :latmin, :latsec, :longdegre,
     :longmin, :longsec, :coordonee, :coordonne2, :method, :cc, :sc, :vs,
     :effort_mode, :start_stop, :nospecies, :species, :comment]
  end

  attr_accessor *attr_list

  def initialize(row)
    self.class.attr_list.each_with_index do |attr, index|
      send("#{attr.to_s}=", row[index])
    end
  end

  def vessel
    Vessel.where(name: boat).first_or_create!
  end

  def cloud_cover
    CloudCover.where(id: cc).first
  end

  def sea_state
    SeaState.where(id: sc).first
  end

  def species
    # Species.find(name: @species).first_or_create! if @species.present?
    nil
  end

  def save
    Sighting.new(vessel: vessel, latitude: coordonee,
                 longitude: coordonne2, cloud_cover: cloud_cover,
                 sea_state: sea_state, comments: comment, species: species)
  end
end

class FmpInd
  def self.attr_list
    [:no_ind, :field_id, :id, :position_in_group, :biopsy, :cow_calf,
     :first_sight, :date, :time, :species, :boat]
  end

  attr_accessor *attr_list

  def initialize(row)
    self.class.attr_list.each_with_index do |attr, index|
      send("#{attr.to_s}=", row[index])
    end
  end

  def biopsy

  end

  def time
    "#{@date} #{@time}".to_time
  end

  def vessel
    Vessel.where(name: boat).first_or_create!
  end

  def species
    Species.where(name: @species).first_or_create!
  end

  def save
    Animal.create(number: no_ind, field_id: field_id, pics_id: id,
               position_in_group: position_in_group, biopsy: biopsy,
               cow_calf: cow_calf, first_sight: first_sight,
               time: time, species: species, vessel: vessel)
  end
end

namespace :import_data do
  desc "Import data from FMP for sightings"
  task sighting_fmp: :environment do
    CSV.foreach("#{Rails.root}/db/data/fmp_ind.csv") do |row|
      fmp_sighting = FmpSighting.new(row)
      fmp_sighting.save
    end
  end

  desc "Import data from FMP for inds"
  task ind_fmp: :environment do
    CSV.foreach("#{Rails.root}/db/data/fmp_ind.csv") do |row|
      fmp_ind = FmpInd.new(row)
      fmp_ind.save
    end
  end
end
