class Animal < ActiveRecord::Base
  belongs_to :biopsy
  belongs_to :fece
  belongs_to :blow
  belongs_to :vessel
  belongs_to :species

  def to_s
    name
  end
end
