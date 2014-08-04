class Sighting < ActiveRecord::Base
  belongs_to :region
  belongs_to :vessel
  belongs_to :sea_state
  belongs_to :cloud_cover
  belongs_to :mode

  def self.search(search)
    where(search.delete_if { |k,v| v.empty? })
  end

end
