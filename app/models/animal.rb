class Animal < ActiveRecord::Base
  belongs_to :biopsy
  belongs_to :fece
  belongs_to :blow

  def to_s
    name
  end
end
