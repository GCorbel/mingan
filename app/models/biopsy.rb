class Biopsy < ActiveRecord::Base
  belongs_to :sighting

  def to_s
    "#{tissue} - #{preservation} - #{purpose} - #{reaction}"
  end
end
