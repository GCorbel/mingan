class MicsPix < ActiveRecord::Base
  establish_connection(:mics_pix)
  def self.table_name
    "whale"
  end
end
