require 'spec_helper'

describe SightingsPresenter do
  describe "#all_sightings" do
    it "give all sightings" do
      sightings = double
      allow(Sighting).to receive(:all).and_return(sightings)
      expect(subject.all_sightings).to eq sightings
    end
  end
end
