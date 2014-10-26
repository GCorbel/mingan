require 'spec_helper'

describe MicsPixLinkCreator do
  describe "#call" do
    it 'give the link for an animal' do
      animal = create(:animal, pics_id: "H009")
      link_creator = MicsPixLinkCreator.new(animal: animal)
      #stub_request("6261")
      expect(link_creator.call).to eq \
        "http://micspix.pvp.ca/MICSWhaleMacthing/Public/editWhale?6261"
    end
  end

  def stub_request(result)
    row = double(FBatchFolderId: result)
    allow(MicsPix).to receive(:find_by).and_return(row)
  end
end
