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
    @@mics_pix_values ||= MicsPix.all.each_with_object({}) { |m,h| h[m.MICS_ID] = m.FBatchFolderId }
  end
end
