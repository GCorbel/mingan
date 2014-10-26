class MicsPixLinkCreator
  attr_accessor :animal

  def initialize(animal:)
    @animal = animal
  end

  def call
    "http://micspix.pvp.ca/MICSWhaleMacthing/Public/editWhale?#{link_id}"
  end

  private

  def link_id
    mics_pix_values[animal.pics_id]
  end

  def mics_pix_values
    values = {}
    @@mics_pix_values ||= MicsPix.select(:mics_id, :FBatchFolderId).each do |row|
      values[row.mics_id] = row.FBatchFolderId
    end
    values
  end
end
