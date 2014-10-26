module ApplicationHelper
  def link_to_mics_pix(animal:)
    if animal.pics_id.present?
      link_to "MicsPix", MicsPixLinkCreator.new(animal: animal).call,
        target: '_blank'
    end
  end
end
